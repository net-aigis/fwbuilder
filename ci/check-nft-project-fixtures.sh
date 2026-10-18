#!/usr/bin/env bash
# Run additional real FWB projects through the native compiler (no second build).
# Positive cases are copied into the existing output artifact; the next CI job
# applies nft --check and isolated network namespace tests to every one of them.
set -euo pipefail

if (( $# != 3 )); then
    echo 'Usage: check-nft-project-fixtures.sh COMPILER BASELINE.fwb OUTPUT_DIR' >&2
    exit 2
fi
compiler=$1
baseline=$2
output=$3
[[ -x "$compiler" && -s "$baseline" ]] || { echo 'Missing compiler or baseline' >&2; exit 2; }
command -v python3 >/dev/null || { echo 'python3 missing' >&2; exit 2; }

mkdir -p "$output"
output="$(cd "$output" && pwd -P)"
work="$(dirname "$output")/nft-project-fixtures"
mkdir -p "$work"
python3 ci/generate-nft-project-fixtures.py "$baseline" "$work/xml"

# Both the expected native expression AND the existence of a nonempty generated
# policy are mandatory; successful exit with silently omitted rules fails.
check_positive() {
    local name=$1 expected=$2 generated
    mkdir -p "$work/$name"
    "$compiler" -f "$work/xml/$name.fwb" -d "$work/$name" nft-test \
        > "$work/$name.compile.log" 2>&1 || {
        cat "$work/$name.compile.log" >&2
        echo "FAIL: native FWB compiler rejected $name" >&2
        return 1
    }
    shopt -s nullglob
    local files=("$work/$name"/*.fw)
    if (( ${#files[@]} != 1 )) || [[ ! -s "${files[0]}" ]]; then
        echo "FAIL: expected exactly one native generated script for $name" >&2
        return 1
    fi
    generated="${files[0]}"
    sh ci/check-nft-output.sh "$generated" || return 1
    # Search inside the native ruleset heredoc, not in explanatory shell text.
    if ! awk '/<<\047FWB_NFT_RULESET\047/ { on=1; next } /^FWB_NFT_RULESET$/ { on=0 } on { print }' \
        "$generated" | grep -Eq "$expected"; then
        echo "FAIL: $name has no expected nftables expression ($expected)" >&2
        return 1
    fi
    cp -- "$generated" "$output/nft-ci-$name.fw"
    echo "PASS: $name generated real native nftables policy"
}

# Reject checks require BOTH nonzero exit and the relevant compiler diagnostic.
# An unrelated XML/configuration failure must never count as a negative pass.
check_negative() {
    local name=$1 expected=$2
    mkdir -p "$work/$name"
    if "$compiler" -f "$work/xml/$name.fwb" -d "$work/$name" nft-test \
        > "$work/$name.compile.log" 2>&1; then
        echo "FAIL: unsupported $name compiled successfully" >&2
        return 1
    fi
    if ! grep -Fq "$expected" "$work/$name.compile.log"; then
        cat "$work/$name.compile.log" >&2
        echo "FAIL: $name failed without expected guard: $expected" >&2
        return 1
    fi
    echo "PASS: $name rejected by the specific native compiler guard"
}

check_positive ipv6-icmp 'ip6 saddr'
if ! grep -Eq 'icmpv6 type' "$output/nft-ci-ipv6-icmp.fw"; then
    echo 'FAIL: IPv6 fixture lost its ICMPv6 service condition' >&2
    exit 1
fi
check_positive udp-workhours 'meta hour'
# Verify the weekday condition independently, not just that a time is emitted.
if ! grep -Eq 'meta day' "$output/nft-ci-udp-workhours.fw"; then
    echo 'FAIL: time fixture lost its weekday constraint' >&2
    exit 1
fi
check_positive policy-fragments 'ip frag-off'
check_positive nat-fragments 'ip frag-off'

check_negative reject-policy-options 'Native nftables IP option matching is not yet supported'
check_negative reject-nat-options 'Native nftables NAT IP option matching is not supported'
check_negative reject-timezone 'xt_time kernel timezone mode is not supported by native nftables'

echo 'PASS: all seven real FWB XML fixture scenarios (4 supported, 3 rejected)'
