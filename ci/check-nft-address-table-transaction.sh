#!/bin/sh
# Focused, privilege-free regression for transactional native address tables.
# The compile-time guard remains until an actual FWB fixture passes nft -f.
set -eu
cd "$(dirname "$0")/.."
work=$(mktemp -d) || exit 1
trap 'rm -rf "$work"' EXIT HUP INT TERM
sed -e '/^{{if /d' -e '/^{{endif}}/d' \
    -e 's#{{$load_files_commands}}#fwb_nft_stage_one_address_table blocked "$FWB_SOURCE_FILE" || return 1#' \
    src/res/configlets/nftables/nft_run_time_address_tables > "$work/functions.sh"
sh -n "$work/functions.sh"
cat > "$work/nft" <<'MOCK'
#!/bin/sh
set -eu
if [ "$1" = '-f' ]; then
    cp -- "$2" "$FWB_NFT_BATCH_LOG"
    [ "${FWB_NFT_REJECT:-0}" != 1 ] || exit 1
    exit 0
fi
if [ "$1" = 'get' ]; then
    [ "${FWB_NFT_GET_SUCCESS:-0}" = 1 ]
    exit $?
fi
exit 2
MOCK
chmod +x "$work/nft"
cat > "$work/addresses" <<'DATA'
# Comment
192.0.2.1
2001:db8::1
DATA
export NFT="$work/nft" FWB_NFT_BATCH_LOG="$work/last.nft"
export FWB_SOURCE_FILE="$work/addresses"
# All operations below are isolated to the mock CLI, never to host nftables.
. "$work/functions.sh"
FWB_NFT_TXN="$work/start.nft"
: > "$FWB_NFT_TXN"
fwb_nft_stage_address_tables
[ "$(grep -c '^add table ' "$FWB_NFT_TXN")" -eq 6 ]
[ "$(grep -c '^add set ' "$FWB_NFT_TXN")" -eq 6 ]
[ "$(grep -c '^add element ' "$FWB_NFT_TXN")" -eq 6 ]
[ "$(grep -c '^add element ip fwb_filter blocked { 192.0.2.1 }$' "$FWB_NFT_TXN")" -eq 1 ]
[ "$(grep -c '^add element ip6 fwb_filter blocked { 2001:db8::1 }$' "$FWB_NFT_TXN")" -eq 1 ]
if grep -Eq '(^| )\$NFT (flush|add) set ' "$FWB_NFT_TXN"; then exit 1; fi
reload_address_table blocked "$FWB_SOURCE_FILE"
[ "$(grep -c '^flush set ' "$FWB_NFT_BATCH_LOG")" -eq 6 ]
[ "$(grep -c '^add element ' "$FWB_NFT_BATCH_LOG")" -eq 6 ]
add_to_address_table blocked "$FWB_SOURCE_FILE" 198.51.100.3
[ "$(tail -n 1 "$FWB_SOURCE_FILE")" = '198.51.100.3' ]
[ "$(grep -c '^add element ' "$FWB_NFT_BATCH_LOG")" -eq 9 ]
remove_from_address_table blocked "$FWB_SOURCE_FILE" 198.51.100.3
! grep -Fq '198.51.100.3' "$FWB_SOURCE_FILE"
[ "$(grep -c '^add element ' "$FWB_NFT_BATCH_LOG")" -eq 6 ]
cp "$FWB_SOURCE_FILE" "$work/before"
FWB_NFT_REJECT=1
export FWB_NFT_REJECT
if add_to_address_table blocked "$FWB_SOURCE_FILE" 192.0.2.2; then
    echo 'ERROR: ignored rejected nft transaction' >&2; exit 1
fi
cmp "$work/before" "$FWB_SOURCE_FILE"
unset FWB_NFT_REJECT
printf '192.0.2.1; delete table ip foreign\n' > "$work/bad-addresses"
if reload_address_table blocked "$work/bad-addresses"; then
    echo 'ERROR: accepted injected address line' >&2; exit 1
fi
if fwb_nft_stage_one_address_table 'bad;name' "$FWB_SOURCE_FILE"; then
    echo 'ERROR: accepted injected set name' >&2; exit 1
fi
if add_to_address_table blocked "$FWB_SOURCE_FILE" '192.0.2.3;drop'; then
    echo 'ERROR: accepted injected address argument' >&2; exit 1
fi
cmp "$work/before" "$FWB_SOURCE_FILE"
[ ! -e "${FWB_SOURCE_FILE}.fwb-lock" ]
FWB_NFT_GET_SUCCESS=1
export FWB_NFT_GET_SUCCESS
test_address_table blocked '192.0.2.1'
unset FWB_NFT_GET_SUCCESS
if test_address_table blocked '192.0.2.3;delete table'; then
    echo 'ERROR: accepted injected membership argument' >&2; exit 1
fi
printf 'PASS: nft sets staged before policy in one transaction; reload/add/remove atomic; disk rollback and injection guards\n'
