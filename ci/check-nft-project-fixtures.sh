#!/usr/bin/env bash
# Check independent native FWB XML fixtures without triggering another build.
# Every scenario is executed even when an earlier one fails; only fully
# verified positive outputs are published for nft --check/kernel testing.
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

# An explicit -4/-6 is essential.  The default fwb_nft invocation in the
# previous CI run produced only an IPv4 block, silently omitting the IPv6 rule.
# Checking the compiled ruleset (not the XML) prevents a false positive.
check_positive() {
    local name=$1 family=$2 generated expected
    shift 2
    local -a args=()
    case "$family" in
        4) args=(-4) ;;
        6) args=(-6) ;;
        *) echo "Internal error: unsupported test family: $family" >&2; return 1 ;;
    esac
    mkdir -p "$work/$name"
    if ! "$compiler" "${args[@]}" -f "$work/xml/$name.fwb" -d "$work/$name" nft-test \
        > "$work/$name.compile.log" 2>&1; then
        cat "$work/$name.compile.log" >&2
        echo "FAIL: native FWB compiler rejected $name (IPv$family)" >&2
        return 1
    fi

    local -a files=()
    shopt -s nullglob
    files=("$work/$name"/*.fw)
    shopt -u nullglob
    if (( ${#files[@]} != 1 )) || [[ ! -s "${files[0]}" ]]; then
        echo "FAIL: expected exactly one generated script for $name" >&2
        return 1
    fi
    generated="${files[0]}"
    if ! sh ci/check-nft-output.sh "$generated"; then
        echo "FAIL: invalid native script structure for $name" >&2
        return 1
    fi

    # Store the extracted ruleset for reproducible diagnostics.  Testing the
    # script preamble could accidentally accept unrelated IPv6 addresses.
    if ! awk '/<<\047FWB_NFT_RULESET\047/ { on=1; next } /^FWB_NFT_RULESET$/ { on=0 } on { print }' \
        "$generated" > "$work/$name.ruleset.nft"; then
        echo "FAIL: could not extract native ruleset for $name" >&2
        return 1
    fi
    local table_family=ip
    [[ "$family" == 6 ]] && table_family=ip6
    if ! grep -Eq "^add table $table_family fwb_filter[[:space:]]*\$" "$work/$name.ruleset.nft"; then
        # For IPv4 the family is "ip" and for IPv6 it is "ip6".
        echo "FAIL: $name has no IPv$family filter table" >&2
        return 1
    fi
    for expected in "$@"; do
        if ! grep -Eq "^add rule $table_family fwb_(filter|nat|mangle) .*${expected}" "$work/$name.ruleset.nft"; then
            echo "FAIL: $name has no expected nftables expression ($expected)" >&2
            return 1
        fi
    done
    cp -- "$generated" "$output/nft-ci-$name.fw"
    echo "PASS: $name (IPv$family) generated and verified native rules"
}

# Validate the *actual* three-rule negation lowering for ordinary FWB
# Srv neg=True. A sequence of nft matches is AND, so prefixing "not" or
# negating just the first expression would change policy semantics.
check_negated_ip_service() {
    local name=$1 match=$2
    if ! check_positive "$name" 4 "$match"; then
        return 1
    fi
    python3 - "$work/$name.ruleset.nft" "$match" <<'PY_NEGATED_IP_SERVICE'
import re
import sys
from pathlib import Path

lines = Path(sys.argv[1]).read_text().splitlines()
expected = re.compile(sys.argv[2])
rules = []
for index, line in enumerate(lines):
    match = re.fullmatch(r'add rule ip fwb_filter (\S+) (.+)', line)
    if match:
        rules.append((index, match.group(1), match.group(2)))

matched = [(idx, chain, body) for idx, chain, body in rules
           if expected.search(body) and body.endswith(' return')]
if not matched:
    sys.exit('FAIL: negated IP service has no positive-match return rule')
for idx, chain, body in matched:
    if re.search(r'\bnot\s', body):
        sys.exit('FAIL: native negation emitted an invalid not prefix')
    jumps = [(i, c, b) for i, c, b in rules
             if i < idx and c != chain and re.search(
                 r'\bjump\s+' + re.escape(chain) + r'\s*$', b)]
    tails = [(i, b) for i, c, b in rules
             if i > idx and c == chain and (b == 'accept' or b.endswith(' accept'))]
    if not jumps or not tails:
        sys.exit('FAIL: negated IP service is missing jump/return/accept ordering')
    # The fallback action is reached only when the positive service did not
    # match.  A service match *alone* must not trigger the accept action.
    if any(expected.search(b) for _, b in tails):
        sys.exit('FAIL: negated service is present in terminal accept rule')
print('PASS: negated IP service uses jump / positive match return / accept')
PY_NEGATED_IP_SERVICE
}

# Unsupported options must fail with the *specific* fail-closed diagnostic.
check_negative() {
    local name=$1 expected=$2
    mkdir -p "$work/$name"
    if "$compiler" -4 -f "$work/xml/$name.fwb" -d "$work/$name" nft-test \
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

# The set fixture is a full generated shell script. Its nft transactions are
# assembled at runtime from an external file, not from a static heredoc.
# Keep it out of the direct-transaction checks, and test it via real start.
check_dynamic_sets() {
    local name=dynamic-address-sets
    mkdir -p "$work/$name" "$output/../nft-sets-output"
    if ! "$compiler" -4 -f "$work/xml/$name.fwb" -d "$work/$name" nft-test \
         > "$work/$name.compile.log" 2>&1; then
        cat "$work/$name.compile.log" >&2
        return 1
    fi
    local -a generated=("$work/$name"/*.fw)
    [[ ${#generated[@]} == 1 && -s ${generated[0]} ]] || return 1
    sh -n "${generated[0]}" || return 1
    grep -Fq 'fwb_nft_stage_address_tables || exit 1' "${generated[0]}" || return 1
    grep -Eq 'add rule ip fwb_filter .*ip saddr @bad_guys' "${generated[0]}" || return 1
    grep -Fq "fwb_nft_stage_one_address_table 'bad_guys' '/tmp/fwb-pr6-ci-address-set.data'" "${generated[0]}" || return 1
    # block_action() has a separate emergency-policy transaction, so its
    # add-table declarations are not duplicates in the start transaction.
    if awk '
        /^block_action\(\) \{/ { in_block = 1; next }
        in_block && /^}/ { in_block = 0; next }
        !in_block && /^add table ip fwb_filter[[:space:]]*$/ { duplicate = 1 }
        END { exit !duplicate }
    ' "${generated[0]}"; then
        echo 'Unexpected duplicate add-table declaration in set mode' >&2
        return 1
    fi
    cp -- "${generated[0]}" "$output/../nft-sets-output/nft-ci-dynamic-address-sets.fw"
    echo 'PASS: dynamic-address-sets generated from real FWB AddressTable'
}

# Do not let the first failing fixture hide the other six outcomes.
failures=0
cases=0
run_case() {
    local name=$1
    shift
    cases=$((cases+1))
    if "$@"; then
        printf 'RESULT: PASS %s\n' "$name"
    else
        failures=$((failures+1))
        printf 'RESULT: FAIL %s\n' "$name" >&2
    fi
}

run_case ipv6-icmp check_positive ipv6-icmp 6 'ip6 saddr' 'icmpv6 type'
run_case ipv6-ndp check_positive ipv6-ndp 6 'icmpv6 type 128' 'icmpv6 type 135' 'icmpv6 type 136'
run_case udp-workhours check_positive udp-workhours 4 'meta hour' 'meta day'
run_case policy-fragments check_positive policy-fragments 4 'ip frag-off'
run_case nat-fragments check_positive nat-fragments 4 'ip frag-off'
run_case ipv4-option-rr check_positive ipv4-option-rr 4 'ip option rr exists'
run_case ipv4-option-lsrr check_positive ipv4-option-lsrr 4 'ip option lsrr exists'
run_case ipv4-option-ssrr check_positive ipv4-option-ssrr 4 'ip option ssrr exists'
run_case ipv4-option-ra check_positive ipv4-option-ra 4 'ip option ra exists'
run_case ipv4-option-any check_positive ipv4-option-any 4 'ip hdrlength > 5'
run_case ipv4-option-combined check_positive ipv4-option-combined 4 'ip option lsrr exists ip option rr exists'
run_case negated-ipv4-option-rr check_negated_ip_service negated-ipv4-option-rr 'ip option rr exists'
run_case negated-ipv4-option-ra check_negated_ip_service negated-ipv4-option-ra 'ip option ra exists'
run_case negated-ipv4-option-any check_negated_ip_service negated-ipv4-option-any 'ip hdrlength > 5'
run_case negated-ipv4-option-combined check_negated_ip_service negated-ipv4-option-combined 'ip option lsrr exists ip option rr exists'
run_case negated-ipv4-fragment check_negated_ip_service negated-ipv4-fragment 'ip frag-off'
run_case reject-negated-ipv4-timestamp check_negative reject-negated-ipv4-timestamp 'Native nftables IPv4 timestamp option matching is not supported'
run_case reject-policy-options check_negative reject-policy-options 'Native nftables IPv4 timestamp option matching is not supported'
run_case reject-nat-options check_negative reject-nat-options 'Native nftables NAT IP option matching is not supported'
# Preserve legacy contiguous LB pools, add native sparse distribution and
# reject unsafe target objects or unsupported address+port translations.
run_case nat-lb-contiguous check_positive nat-lb-contiguous 4 'dnat to 192\.168\.1\.100-192\.168\.1\.101'
run_case nat-lb-sparse check_positive nat-lb-sparse 4 'dnat to numgen random mod 2 map \{ 0 : 192\.168\.1\.100, 1 : 192\.168\.1\.103 \}'
run_case reject-nat-lb-network check_negative reject-nat-lb-network 'Native nftables load-balancing destinations must be host addresses of the selected IP family'
run_case reject-nat-lb-duplicate check_negative reject-nat-lb-duplicate 'Duplicate native nftables load-balancing destination'
run_case reject-nat-lb-port-translation check_negative reject-nat-lb-port-translation 'Native nftables load-balancing address maps cannot translate ports'
run_case reject-timezone check_negative reject-timezone 'xt_time kernel timezone mode is not supported by native nftables'
# Real traffic fixtures are compiled from FWB XML, never handwritten nft.
# Their emitted policies are exercised against real packets in ci/check-nft-packets.py.
run_case packet-tcp-input check_positive packet-tcp-input 4 'tcp dport 80'
run_case packet-udp-forward check_positive packet-udp-forward 4 'udp dport 53'
run_case packet-snat check_positive packet-snat 4 'udp dport 53' 'snat to 192\.0\.2\.100'
run_case packet-dnat check_positive packet-dnat 4 'tcp dport 80' 'ip daddr 192\.0\.2\.101' 'dnat to 192\.168\.1\.100'
run_case dynamic-address-sets check_dynamic_sets


printf 'FWB XML fixture matrix: %d cases; %d passed; %d failed\n' \
    "$cases" "$((cases - failures))" "$failures"
if (( failures )); then
    exit 1
fi
echo 'PASS: real FWB XML fixture matrix including dynamic address tables'
