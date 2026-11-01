#!/bin/sh
# Run the compiler-generated firewall script whose routing activation must
# fail after nftables commit, then roll back only the routes it installed.
set -eu

[ "$#" -eq 1 ] || { echo 'Usage: check-nft-route-rollback.sh nft-ci-ipv6-route-rollback.fw' >&2; exit 2; }
fw=$1
[ "${fw##*/}" = nft-ci-ipv6-route-rollback.fw ] && [ -s "$fw" ] || {
    echo 'REFUSING unrecognized generated routing rollback fixture' >&2
    exit 2
}
[ -n "${FWB_START_PARENT_NETNS:-}" ] || {
    echo 'REFUSING routing rollback without the parent namespace marker' >&2
    exit 2
}
this_net=$(readlink /proc/self/ns/net)
[ "$this_net" != "$FWB_START_PARENT_NETNS" ] && \
[ "$this_net" != "$(readlink /proc/1/ns/net)" ] || {
    echo 'REFUSING generated routing rollback outside a nested network namespace' >&2
    exit 2
}
python3 - <<'PY_CAP'
from pathlib import Path
values = {}
for line in Path('/proc/self/status').read_text().splitlines():
    if line.startswith(('CapEff:', 'CapBnd:')):
        name, val = line.split(':', 1)
        values[name] = int(val.strip(), 16)
for name in ('CapEff', 'CapBnd'):
    if name not in values:
        raise SystemExit('cannot verify Linux capability restrictions: ' + name)
    for bit in (16, 17, 21):
        if values[name] & (1 << bit):
            raise SystemExit('unsafe capability %s remains in %s' % (bit, name))
PY_CAP
for tool in nft ip mktemp python3; do
    command -v "$tool" >/dev/null 2>&1 || { echo "Missing $tool" >&2; exit 2; }
done

scratch=$(mktemp -d) || exit 1
trap 'rm -rf "$scratch"' EXIT
trap 'exit 1' HUP INT TERM

cat > "$scratch/modprobe" <<'SHIM'
#!/bin/sh
printf 'modprobe intercepted: %s\n' "$*" >> "$FWB_CI_MODPROBE_LOG"
exit 0
SHIM
chmod 0700 "$scratch/modprobe"
export FWB_CI_MODPROBE_LOG="$scratch/modprobe.log"
: > "$FWB_CI_MODPROBE_LOG"
python3 - "$fw" "$scratch/firewall.fw" "$scratch/modprobe" <<'PY_COPY'
from pathlib import Path
import sys
source, dest, shim = map(Path, sys.argv[1:])
raw = source.read_bytes()
original = b'MODPROBE="modprobe"'
if raw.count(original) != 1:
    raise SystemExit('REFUSING generated script with an unexpected MODPROBE assignment')
modified = raw.replace(original, b'MODPROBE="' + bytes(shim) + b'"', 1)
required = (
    b'$IP route add default via 192.168.1.10 dev eth1',
    b'$IP -6 route add 2001:db8:9::/64 metric 100 via 2001:db8:1::fe dev eth0',
    b'fwb_route_prepare 6 ',
    b'2001:db8:1::/64',
)
for needle in required:
    if needle not in raw:
        raise SystemExit('REFUSING rollback fixture missing compiler output: ' + needle.decode())
if b'route flush' in raw or b'while read route' in raw:
    raise SystemExit('REFUSING rollback fixture that flushes the routing table')
dest.write_bytes(modified)
dest.chmod(0o700)
PY_COPY

ip link add eth0 type veth peer name eth1
ip link set lo up
ip link set eth0 up
ip link set eth1 up
ip addr add 192.168.1.1/24 dev eth1
ip -6 addr add 2001:db8:2::1/64 dev eth1 nodad
ip route add 203.0.113.0/24 via 192.168.1.9 dev eth1 proto dhcp
ip route add 198.51.100.0/24 via 192.168.1.8 dev eth1 proto static
printf '0' > /proc/sys/net/ipv4/ip_forward

set +e
sh "$scratch/firewall.fw" start > "$scratch/start.log" 2>&1
start_rc=$?
set -e
[ "$start_rc" -eq 1 ] || {
    echo "ERROR: generated start returned $start_rc (expected 1)" >&2
    cat "$scratch/start.log" >&2
    exit 1
}
grep -Fq 'The nftables policy is already active.' "$scratch/start.log"
grep -Fq 'refusing to replace protected route' "$scratch/start.log"
nft list table ip6 fwb_filter >/dev/null
if ip route show default | grep -Fq 'via 192.168.1.10'; then
    echo 'ERROR: rolled-back IPv4 default route is still installed' >&2
    exit 1
fi
if ip -6 route show 2001:db8:9::/64 | grep -Fq '2001:db8:1::fe'; then
    echo 'ERROR: rolled-back IPv6 route is still installed' >&2
    exit 1
fi
ip -6 route show 2001:db8:1::/64 | grep -Fq 'proto kernel'
ip route show 192.168.1.0/24 | grep -Fq 'proto kernel'
ip route show 203.0.113.0/24 | grep -Fq 'proto dhcp'
ip route show 198.51.100.0/24 | grep -Fq 'proto static'
[ "$(cat /proc/sys/net/ipv4/ip_forward)" = 0 ] || {
    echo 'ERROR: routing failure still enabled forwarding' >&2
    exit 1
}
printf 'RESULT: PASS generated-route-rollback\n'
