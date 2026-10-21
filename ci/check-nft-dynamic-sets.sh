#!/bin/sh
# Real kernel test of compiler-generated transactional dynamic AddressTables.
# Parent must already be inside CI's isolated netns. We create another one
# and drop globally hazardous capabilities before running the generated script.
set -eu

[ "$#" -gt 0 ] || { echo 'Missing generated firewall script' >&2; exit 2; }
case "$#:$1" in
    1:*) mode=outer; fw=$1 ;;
    2:--inner) mode=inner; fw=$2 ;;
    *) echo 'Usage: check-nft-dynamic-sets.sh SCRIPT.fw' >&2; exit 2 ;;
esac
[ "${fw##*/}" = 'nft-ci-dynamic-address-sets.fw' ] && [ -s "$fw" ] || {
    echo 'REFUSING unexpected AddressTable fixture' >&2; exit 2;
}
# Absolute path persists through the nested unshare. Do not trust a relative path.
case "$fw" in /*) ;; *) fw="$(pwd)/$fw" ;; esac
[ "$(readlink /proc/self/ns/net)" != "$(readlink /proc/1/ns/net)" ] || {
    echo 'REFUSING dynamic sets on CI host network' >&2; exit 2;
}

if [ "$mode" = outer ]; then
    command -v setpriv >/dev/null 2>&1 || exit 2
    command -v unshare >/dev/null 2>&1 || exit 2
    parent_net=$(readlink /proc/self/ns/net)
    export FWB_SETS_PARENT_NETNS="$parent_net"
    exec unshare --net -- setpriv --no-new-privs --bounding-set=-sys_module,-sys_admin,-sys_rawio -- \
        sh "$0" --inner "$fw"
fi

[ -n "${FWB_SETS_PARENT_NETNS:-}" ] && \
[ "$(readlink /proc/self/ns/net)" != "$FWB_SETS_PARENT_NETNS" ] || {
    echo 'REFUSING dynamic sets outside inner netns' >&2; exit 2;
}
python3 - <<'PY_CAP'
from pathlib import Path
v = {}
for line in Path('/proc/self/status').read_text().splitlines():
    if line.startswith(('CapEff:', 'CapBnd:')):
        name, value = line.split(':', 1)
        v[name] = int(value.strip(), 16)
for name in ('CapEff', 'CapBnd'):
    assert name in v, 'cannot verify capability set'
    for bit in (16, 17, 21):
        assert not (v[name] & (1 << bit)), f'{name}: unsafe capability {bit}'
PY_CAP
for cmd in nft ip python3 mktemp; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "Missing $cmd" >&2; exit 2; }
done
scratch=$(mktemp -d) || exit 1
data_file=/tmp/fwb-pr6-ci-address-set.data
[ ! -e "$data_file" ] || { echo 'Refusing preexisting address-table CI data file' >&2; exit 2; }
trap 'rm -f "$data_file"; rm -rf "$scratch"' EXIT
trap 'exit 1' HUP INT TERM
cat > "$scratch/modprobe" <<'SHIM'
#!/bin/sh
printf 'modprobe intercepted: %s\n' "$*" >> "$FWB_CI_MODPROBE_LOG"
exit 0
SHIM
chmod 0700 "$scratch/modprobe"
FWB_CI_MODPROBE_LOG="$scratch/modprobe.log"
export FWB_CI_MODPROBE_LOG
: > "$FWB_CI_MODPROBE_LOG"
python3 - "$fw" "$scratch/firewall.fw" "$scratch/modprobe" <<'PY_COPY'
from pathlib import Path
import sys
source, dest, shim = map(Path, sys.argv[1:])
raw = source.read_bytes()
old = b'MODPROBE="modprobe"'
assert raw.count(old) == 1, 'unexpected modprobe assignment'
assert shim.is_absolute() and b'"' not in bytes(shim) and b'\n' not in bytes(shim)
modified = raw.replace(old, b'MODPROBE="' + bytes(shim) + b'"', 1)
assert modified.replace(b'MODPROBE="' + bytes(shim) + b'"', old, 1) == raw
for required in (b'fwb_nft_stage_address_tables || exit 1',
                 b"fwb_nft_stage_one_address_table 'bad_guys'",
                 b'ip saddr @bad_guys', b'FWB_NFT_RULESET'):
    assert required in raw, 'missing expected FWB AddressTable output: ' + repr(required)
dest.write_bytes(modified)
dest.chmod(0o700)
PY_COPY
printf '192.0.2.2\n2001:db8::2\n' > "$data_file"
ip link add eth0 type veth peer name eth1
ip link set lo up
ip link set eth0 up
ip link set eth1 up
ip addr add 192.168.1.1/24 dev eth1
nft add table ip fwb_ci_foreign
nft add table ip6 fwb_ci_foreign
check_foreign() {
    nft list table ip fwb_ci_foreign >/dev/null && nft list table ip6 fwb_ci_foreign >/dev/null
}
check_member() {
    nft get element "$1" fwb_filter bad_guys '{' "$2" '}' >/dev/null 2>&1
}
run() {
    label=$1; shift
    if ! "$@" > "$scratch/$label.log" 2>&1; then
        cat "$scratch/$label.log" >&2
        echo "ERROR: $label failed" >&2
        exit 1
    fi
}
run start sh "$scratch/firewall.fw" start
check_foreign
check_member ip 192.0.2.2
check_member ip6 2001:db8::2
nft list chain ip fwb_filter INPUT | grep -Fq '@bad_guys'

printf '192.0.2.3\n' > "$data_file"
run reload_set sh "$scratch/firewall.fw" reload_address_table bad_guys "$data_file"
check_member ip 192.0.2.3
! check_member ip 192.0.2.2
! check_member ip6 2001:db8::2
check_foreign

run add sh "$scratch/firewall.fw" add_to_address_table bad_guys "$data_file" 192.0.2.4
check_member ip 192.0.2.4
grep -Fxq '192.0.2.4' "$data_file"
run remove sh "$scratch/firewall.fw" remove_from_address_table bad_guys "$data_file" 192.0.2.4
! check_member ip 192.0.2.4
! grep -Fxq '192.0.2.4' "$data_file"
check_member ip 192.0.2.3

# Failed validation must not change either kernel or persistent file.
cp "$data_file" "$scratch/disk.before"
if sh "$scratch/firewall.fw" add_to_address_table bad_guys "$data_file" '192.0.2.5;delete table ip fwb_filter' > "$scratch/invalid.log" 2>&1; then
    echo 'ERROR: accepted injected address' >&2; exit 1
fi
cmp "$data_file" "$scratch/disk.before"
check_member ip 192.0.2.3
if sh "$scratch/firewall.fw" add_to_address_table bad_guys "$data_file" 999.999.999.999 > "$scratch/invalid-ip.log" 2>&1; then
    echo 'ERROR: accepted invalid IPv4 address' >&2; exit 1
fi
cmp "$data_file" "$scratch/disk.before"
check_member ip 192.0.2.3

run reload sh "$scratch/firewall.fw" reload
check_member ip 192.0.2.3
check_foreign
run stop sh "$scratch/firewall.fw" stop
for family in ip ip6; do
    for table in fwb_filter fwb_mangle fwb_nat; do
        if nft list table "$family" "$table" >/dev/null 2>&1; then
            echo "ERROR: $family $table remained after stop" >&2; exit 1
        fi
    done
done
check_foreign
printf 'PASS: real nftables AddressTable start/reload/add/remove/rollback/stop; third-party tables preserved\n'
printf 'RESULT: PASS dynamic-address-sets-kernel\n'
