#!/bin/sh
# Full generated FWB start/reload shell entrypoint test.
# Called ONLY from check-nft-runtime.sh inside a SECOND, disposable network
# namespace with CAP_SYS_MODULE (and other host-global privileges) dropped.
set -eu

[ "$#" -eq 1 ] || { echo 'Usage: check-nft-start-reload.sh nft-ci-ipv6-ndp.fw' >&2; exit 2; }
fw=$1
[ "${fw##*/}" = nft-ci-ipv6-ndp.fw ] && [ -s "$fw" ] || {
    echo 'REFUSING unrecognized generated start/reload fixture' >&2; exit 2;
}
[ -n "${FWB_START_PARENT_NETNS:-}" ] || {
    echo 'REFUSING start/reload without the parent namespace marker' >&2; exit 2;
}
this_net=$(readlink /proc/self/ns/net)
[ "$this_net" != "$FWB_START_PARENT_NETNS" ] && \
[ "$this_net" != "$(readlink /proc/1/ns/net)" ] || {
    echo 'REFUSING generated start/reload outside a nested network namespace' >&2
    exit 2
}
python3 - <<'PY_CAP'
from pathlib import Path
values = {}
for line in Path('/proc/self/status').read_text().splitlines():
    if line.startswith(('CapEff:', 'CapBnd:')):
        name, val = line.split(':', 1)
        values[name] = int(val.strip(), 16)
# Initial-namespace privileges capable of loading modules or mounting the
# host filesystem must not remain in either the effective or bounding set.
for name in ('CapEff', 'CapBnd'):
    if name not in values:
        raise SystemExit('cannot verify Linux capability restrictions: ' + name)
    for bit in (16, 17, 21):  # SYS_MODULE, SYS_RAWIO, SYS_ADMIN
        if values[name] & (1 << bit):
            raise SystemExit(f'unsafe capability {bit} remains in {name}')
PY_CAP
for tool in nft ip mktemp python3 sha256sum; do
    command -v "$tool" >/dev/null 2>&1 || { echo "Missing $tool" >&2; exit 2; }
done
[ -x /usr/sbin/nft ] || { echo 'Expected /usr/sbin/nft is missing' >&2; exit 2; }

scratch=$(mktemp -d) || exit 1
trap 'rm -rf "$scratch"' EXIT
trap 'exit 1' HUP INT TERM

# Avoid every REAL modprobe execution while preserving the generated shell
# flow. This is the ONLY permitted substitution in the generated script.
# An absolute shim also satisfies check_tools()'s `which $MODPROBE` test.
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
if not shim.is_absolute() or b'\n' in bytes(shim) or b'"' in bytes(shim):
    raise SystemExit('invalid modprobe test shim')
modified = raw.replace(original, b'MODPROBE="' + bytes(shim) + b'"', 1)
if modified.replace(b'MODPROBE="' + bytes(shim) + b'"', original, 1) != raw:
    raise SystemExit('unexpected modification to generated firewall script')
# Verify that this fixture still uses exactly the expected address and
# routing behavior. Any changes must be consciously assessed before RUN.
required = (
    b'update_addresses_of_interface "eth0 ',
    b'2001:db8:1::1/64',
    b'192.0.2.1/24',
    b'Verifying interfaces: eth0 lo eth1',
    b'$IP route add default via 192.168.1.10 dev eth1',
    b'$IP -6 route add 2001:db8:9::/64 metric 100 via 2001:db8:1::fe dev eth0',
    b'$IP -6 route add 2001:db8:8::/64 via fe80::1 dev eth0',
    b'$IP -6 route add default via fe80::1 dev eth0',
    b'nexthop via 2001:db8:1::2 dev eth0',
    b'nexthop via 2001:db8:2::2 dev eth1',
    b'echo 1 > /proc/sys/net/ipv4/ip_forward',
    b'FWB_NFT_RULESET', b'FWB_NFT_BLOCK', b'FWB_NFT_STOP',
    b'"$0" start',
)
for needle in required:
    if needle not in raw:
        raise SystemExit('REFUSING changed generated start/reload fixture: ' + needle.decode())
dest.write_bytes(modified)
dest.chmod(0o700)
PY_COPY

# These interfaces, their addresses, routes and per-netns sysctls exist ONLY
# in the inner network namespace. No veth endpoint is placed on the host.
ip link add eth0 type veth peer name eth1
ip link set lo up
ip link set eth0 up
ip link set eth1 up
ip addr add 192.168.1.1/24 dev eth1
# eth1 is unnumbered in the FWB fixture, so the generated script does not
# configure it. ECMP still uses a nexthop on eth1 in 2001:db8:2::/64.
ip -6 addr add 2001:db8:2::1/64 dev eth1 nodad
# Foreign and DHCP routes that the generated script must not remove.
ip route add 203.0.113.0/24 via 192.168.1.9 dev eth1 proto dhcp
ip route add 198.51.100.0/24 via 192.168.1.8 dev eth1 proto static
nft add table ip fwb_ci_foreign
nft add table ip6 fwb_ci_foreign

check_foreign() {
    nft list table ip fwb_ci_foreign >/dev/null && \
    nft list table ip6 fwb_ci_foreign >/dev/null
}
check_status() {
    expected=$1
    actual=0
    sh "$scratch/firewall.fw" status > "$scratch/status.log" 2>&1 || actual=$?
    if [ "$actual" -ne "$expected" ]; then
        echo "ERROR: generated status returned $actual (expected $expected)" >&2
        cat "$scratch/status.log" >&2
        return 1
    fi
}
check_active() {
    nft list table ip6 fwb_filter >/dev/null && \
    nft list chain ip6 fwb_filter INPUT | grep -Eq 'policy drop' && \
    check_foreign
}
check_inactive() {
    for family in ip ip6; do
        for table in fwb_filter fwb_mangle fwb_nat; do
            if nft list table "$family" "$table" >/dev/null 2>&1; then
                echo "ERROR: unexpected $family $table after generated stop" >&2
                return 1
            fi
        done
    done
    check_foreign
}

check_status 3
# Unknown actions must not claim successful firewall activation.
invalid_rc=0
sh "$scratch/firewall.fw" no-such-action > "$scratch/invalid.log" 2>&1 || invalid_rc=$?
[ "$invalid_rc" -eq 2 ] || {
    echo "ERROR: unknown firewall action returned $invalid_rc (expected 2)" >&2
    cat "$scratch/invalid.log" >&2
    exit 1
}
check_inactive
sh "$scratch/firewall.fw" start > "$scratch/start.log" 2>&1 || {
    cat "$scratch/start.log" >&2
    echo 'ERROR: generated shell start failed' >&2
    exit 1
}
check_active
check_status 0
ip -6 addr show dev eth0 | grep -Fq '2001:db8:1::1/64'
ip -4 addr show dev eth0 | grep -Fq '192.0.2.1/24'
ip route show default | grep -Fq 'via 192.168.1.10 dev eth1'
ip -6 route show default | grep -Fq 'via fe80::1 dev eth0'
ip -6 route show 2001:db8:9::/64 | grep -Fq 'via 2001:db8:1::fe'
ip -6 route show 2001:db8:9::/64 | grep -Fq 'metric 100'
ip -6 route show 2001:db8:8::/64 | grep -Fq 'via fe80::1 dev eth0'
ip -6 route show 2001:db8:50::/64 | grep -Fq 'nexthop'
ip route show 203.0.113.0/24 | grep -Fq 'proto dhcp'
ip route show 198.51.100.0/24 | grep -Fq 'proto static'
ip route show 192.168.1.0/24 | grep -Fq 'proto kernel'
ip -6 route show 2001:db8:1::/64 | grep -Fq 'proto kernel'
# Router-advertisement routes appear only after the script has configured IPv6.
ip -6 route add 2001:db8:77::/64 via fe80::abcd dev eth0 proto ra
[ "$(cat /proc/sys/net/ipv4/ip_forward)" = 1 ] || {
    echo 'ERROR: generated start did not enable forwarding in its namespace' >&2
    exit 1
}
nft list table ip6 fwb_filter > "$scratch/start.rules"

sh "$scratch/firewall.fw" reload > "$scratch/reload.log" 2>&1 || {
    cat "$scratch/reload.log" >&2
    echo 'ERROR: generated shell reload failed' >&2
    exit 1
}
check_active
check_status 0
nft list table ip6 fwb_filter > "$scratch/reload.rules"
cmp "$scratch/start.rules" "$scratch/reload.rules" || {
    echo 'ERROR: generated reload changed the effective IPv6 policy' >&2
    exit 1
}
ip route show default | grep -Fq 'via 192.168.1.10 dev eth1'
ip -6 route show default | grep -Fq 'via fe80::1 dev eth0'
ip -6 route show 2001:db8:77::/64 | grep -Fq 'proto ra'
ip route show 203.0.113.0/24 | grep -Fq 'proto dhcp'
ip route show 198.51.100.0/24 | grep -Fq 'proto static'
ip -6 route show 2001:db8:1::/64 | grep -Fq 'proto kernel'

sh "$scratch/firewall.fw" stop > "$scratch/stop.log" 2>&1 || {
    cat "$scratch/stop.log" >&2
    echo 'ERROR: generated shell stop failed' >&2
    exit 1
}
check_inactive
check_status 3
printf 'PASS: generated shell start/reload/stop with interface configuration, routes, forwarding and module isolation\n'
printf 'RESULT: PASS generated-shell-start-reload\n'
