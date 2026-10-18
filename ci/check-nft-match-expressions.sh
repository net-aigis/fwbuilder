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
echo 'PASS: native NAT IP and policy/mangle CONNMARK generator guards'
"$bin" --grammar > "$fixture"
if command -v nft >/dev/null 2>&1; then
    nft --check --file "$fixture"
    echo 'PASS: native DSCP, fragment, MAC and time expressions accepted by nft --check'
elif [ "${FWB_REQUIRE_NFT:-0}" = 1 ]; then
    echo 'ERROR: nft command required for grammar check' >&2
    exit 1
else
    echo 'SKIP: nft grammar check requires nft binary (performed in CI)'
fi
