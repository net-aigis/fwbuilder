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
