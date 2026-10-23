#!/bin/sh
# Test shared, Qt-independent nft match formatters with the host compiler.
set -eu
cd "$(dirname "$0")/.."
bin=$(mktemp)
fixture=$(mktemp)
trap 'rm -f "$bin" "$fixture"' EXIT HUP INT TERM
${CXX:-c++} -std=c++11 -Wall -Wextra -Werror -O0 -UNDEBUG -I src/nftlib \
    ci/check-nft-match-expressions.cpp src/nftlib/nft_utils.cpp -o "$bin"
"$bin"
echo 'PASS: native DSCP, fragment, MAC and time helpers (positive/negative tests)'
# Exercise the generator paths not covered by the sample .fwb policy.
if grep -Eq -- '-j CONNMARK|--restore-mark' src/nftlib/MangleTableCompiler_nft.cpp; then
    echo 'ERROR: native mangle compiler still emits an iptables CONNMARK target' >&2
    exit 1
fi
if grep -Eq -- '(-m ipv4options|--lsrr|--ssrr|--rr|--ts)' src/nftlib/NATCompiler_PrintRule_nft.cpp; then
    echo 'ERROR: native NAT IP service still emits iptables ipv4options' >&2
    exit 1
fi
if ! grep -Fq 'nft_utils::fragmentMatchExpression' src/nftlib/NATCompiler_PrintRule_nft.cpp ||
   ! grep -Fq 'nft_utils::dscpMatchExpression' src/nftlib/NATCompiler_PrintRule_nft.cpp; then
    echo 'ERROR: native NAT IP match expressions are not used' >&2
    exit 1
fi
# The policy printer must route the generated CONNMARK target through
# the checked native formatter; an iptables jump here is invalid.
if ! grep -Fq 'nft_utils::connmarkActionExpression(' src/nftlib/PolicyCompiler_PrintRule_nft.cpp; then
    echo 'ERROR: native policy compiler bypasses CONNMARK formatter' >&2
    exit 1
fi
if ! grep -Fq 'nft_utils::tosMatchExpression(tos, ipt_comp->ipv6)' src/nftlib/PolicyCompiler_PrintRule_nft.cpp; then
    echo 'ERROR: native policy IPService TOS does not use full-octet formatter' >&2
    exit 1
fi
# A newly created nftables firewall must not default to a mode which
# CompilerDriver_nft_run deliberately rejects pending atomic set support.
python3 - <<'PY_NFT_DEFAULTS'
from pathlib import Path
import xml.etree.ElementTree as ET
root = ET.parse('src/res/platform/nftables.xml').getroot()
node = root.find('./Target/options/default/use_nft_sets')
assert node is not None and node.text.strip().lower() == 'false', 'unsafe default nft set mode'
driver = Path('src/nftlib/CompilerDriver_nft_run.cpp').read_text()
assert 'fwb_nft_stage_address_tables || exit 1' in driver, 'atomic initial set staging missing'
print('PASS: default sets disabled; explicit sets staged in same atomic transaction')
PY_NFT_DEFAULTS
echo 'PASS: native NAT IP, policy IPv4 TOS and CONNMARK generator guards'
sh ci/check-nft-address-table-transaction.sh
"$bin" --grammar > "$fixture"
if command -v nft >/dev/null 2>&1; then
    nft --check --file "$fixture"
    cat > "$fixture" <<'FWB_PR6_IPV4_OPTIONS'
add table ip fwb_pr6_options
add chain ip fwb_pr6_options INPUT { type filter hook input priority 0; policy accept; }
add rule ip fwb_pr6_options INPUT ip hdrlength > 5 counter accept
add rule ip fwb_pr6_options INPUT ip option lsrr exists counter accept
add rule ip fwb_pr6_options INPUT ip option ssrr exists counter accept
add rule ip fwb_pr6_options INPUT ip option rr exists counter accept
add rule ip fwb_pr6_options INPUT ip option ra exists counter accept
add rule ip fwb_pr6_options INPUT ip option lsrr exists ip option rr exists counter accept
FWB_PR6_IPV4_OPTIONS
    nft --check --file "$fixture"
    echo 'PASS: native IPv4 options grammar'
    echo 'PASS: native DSCP, fragment, MAC and time expressions accepted by nft --check'
elif [ "${FWB_REQUIRE_NFT:-0}" = 1 ]; then
    echo 'ERROR: nft command required for grammar check' >&2
    exit 1
else
    echo 'SKIP: nft grammar check requires nft binary (performed in CI)'
fi
