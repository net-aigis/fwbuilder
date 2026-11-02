#!/bin/sh
# Kernel-level nftables transaction/coexistence tests.
# MUST be run only in a newly created network namespace, never on the host.
set -eu

[ "$#" -gt 0 ] || { echo 'Usage: check-nft-runtime.sh SCRIPT.fw ...' >&2; exit 2; }

# The explicit isolation check is independent of the GitHub Actions wrapper.
# /proc/1 is the runner's initial namespace (the job does not unshare PID).
self_net=$(readlink /proc/self/ns/net)
init_net=$(readlink /proc/1/ns/net)
if [ "$self_net" = "$init_net" ]; then
    echo 'REFUSING nftables runtime test outside a separate network namespace' >&2
    exit 2
fi

command -v nft >/dev/null 2>&1 || { echo 'nft executable missing' >&2; exit 2; }

tmp=$(mktemp -d) || exit 1
trap 'rm -rf "$tmp"' EXIT HUP INT TERM

extract() {
    fw=$1
    marker=$2
    dest=$3
    awk -v marker="$marker" '
        {
            if (index($0, "<<\047" marker "\047")) {
                if (active || seen) bad=1
                active=1
                seen++
                next
            }
            if ($0==marker) {
                if (!active) bad=1
                active=0
                closed++
                next
            }
            if (active) print
        }
        END { if (bad || active || seen!=1 || closed!=1) exit 1 }
    ' "$fw" > "$dest" && [ -s "$dest" ]
}

# Deletions are formed from kernel-observed FWB-owned tables only.
# Keep them in the SAME nft -f batch as the replacement policy.
stage_owned_deletions() {
    for family in ip ip6; do
        for table in fwb_filter fwb_mangle fwb_nat; do
            if nft list table "$family" "$table" >/dev/null 2>&1; then
                printf 'delete table %s %s\n' "$family" "$table"
            fi
        done
    done
}

# Create third-party sentinel tables and confirm they survive every action.
nft add table ip fwb_ci_foreign
nft add table ip6 fwb_ci_foreign
check_foreign() {
    nft list table ip fwb_ci_foreign >/dev/null
    nft list table ip6 fwb_ci_foreign >/dev/null
}
# Reuse this invariant after both the direct-transaction and generated-shell
# STOP paths. FWB must not leave stale filter, NAT or mangle tables behind.
check_no_owned_tables() {
    for family in ip ip6; do
        for table in fwb_filter fwb_mangle fwb_nat; do
            if nft list table "$family" "$table" >/dev/null 2>&1; then
                echo "ERROR: $family $table survived stop" >&2
                return 1
            fi
        done
    done
}
# The generated script returns 3 when FWB is inactive, 0 when active.
# The distinction matters when third-party nftables tables still exist.
check_shell_status() {
    expected_status=$1
    status_log=$2
    actual_status=0
    sh "$fw" status >"$status_log" 2>&1 || actual_status=$?
    if [ "$actual_status" -ne "$expected_status" ]; then
        echo "ERROR: generated FWB status returned $actual_status; expected $expected_status" >&2
        cat "$status_log" >&2
        return 1
    fi
}
check_foreign

index=0
packet_cases=0
packet_failures=0
block_cases=0
block_failures=0
recovery_cases=0
recovery_failures=0
shell_lifecycle_cases=0
shell_start_reload_cases=0
shell_route_rollback_cases=0
for fw in "$@"; do
    [ -s "$fw" ] || { echo "Missing policy: $fw" >&2; exit 1; }
    index=$((index + 1))
    dir="$tmp/$index"
    mkdir "$dir"
    extract "$fw" FWB_NFT_RULESET "$dir/start.nft" || exit 1
    extract "$fw" FWB_NFT_BLOCK "$dir/block.nft" || exit 1
    extract "$fw" FWB_NFT_STOP "$dir/stop.nft" || exit 1

    echo "Kernel transaction test: $fw"

    # The generated start transaction may contain only IPv4, only IPv6,
    # or both. Check exactly those FWB filter tables, not a hard-coded
    # IPv4 table. The emergency block action still covers BOTH families.
    active_families=''
    first_family=''
    for family in ip ip6; do
        if grep -Eq "^[[:space:]]*add table ${family} fwb_filter[[:space:]]*$" "$dir/start.nft"; then
            active_families="$active_families $family"
            [ -n "$first_family" ] || first_family=$family
        fi
    done
    [ -n "$active_families" ] || {
        echo "ERROR: no FWB filter table in start transaction: $fw" >&2
        exit 1
    }

    check_active_filters() {
        for family in $active_families; do
            nft list table "$family" fwb_filter >/dev/null || return 1
        done
    }

    # Start, including real kernel validation of chains, hooks and NAT.
    { stage_owned_deletions; cat "$dir/start.nft"; } > "$dir/install.nft"
    nft -f "$dir/install.nft"
    check_active_filters
    check_foreign

    # An apply-time failure AFTER staged deletions must roll the complete
    # transaction back; otherwise an invalid reload could remove the firewall.
    # Snapshot ALL tables, including NAT/mangle and both IP families. A
    # rejected atomic reload must preserve the complete kernel ruleset.
    nft -a list ruleset > "$dir/before-failed-reload.txt"
    {
        stage_owned_deletions
        cat "$dir/start.nft"
        printf 'add rule %s fwb_filter FWB_CI_MISSING_CHAIN counter\n' "$first_family"
    } > "$dir/broken-reload.nft"
    if nft -f "$dir/broken-reload.nft" >"$dir/rejected.log" 2>&1; then
        echo 'ERROR: deliberately invalid reload succeeded' >&2
        exit 1
    fi
    nft -a list ruleset > "$dir/after-failed-reload.txt"
    cmp "$dir/before-failed-reload.txt" "$dir/after-failed-reload.txt" || {
        echo 'ERROR: rejected reload changed active FWB policy' >&2
        exit 1
    }
    check_foreign

    # Valid reload must retain third-party tables.
    { stage_owned_deletions; cat "$dir/start.nft"; } > "$dir/reload.nft"
    nft -f "$dir/reload.nft"
    check_active_filters
    check_foreign

    # Verify real packet decisions ONLY for specially generated FWB fixtures.
    # This runs inside the same disposable network namespace as the existing
    # transaction test.  It must not install handcrafted nftables policies.
    case "${fw##*/}" in
        nft-ci-ipv6-icmp.fw|nft-ci-ipv6-ndp.fw|nft-ci-packet-tcp-input.fw|nft-ci-packet-udp-forward.fw|nft-ci-packet-snat.fw|nft-ci-packet-dnat.fw)
            packet_cases=$((packet_cases + 1))
            if python3 ci/check-nft-packets.py "${fw##*/}" "$dir/start.nft"; then
                echo "RESULT: PASS packet-${fw##*/}"
            else
                packet_failures=$((packet_failures + 1))
                echo "RESULT: FAIL packet-${fw##*/}" >&2
            fi
            ;;
    esac

    # Emergency block: replace FWB tables and install DROP chains.
    { stage_owned_deletions; cat "$dir/block.nft"; } > "$dir/block-transaction.nft"
    nft -f "$dir/block-transaction.nft"
    nft list chain ip fwb_filter INPUT | grep -Eq 'policy drop'
    nft list chain ip6 fwb_filter INPUT | grep -Eq 'policy drop'
    check_foreign

    # Verify that an emergency block ACTUALLY stops real traffic, including
    # the flows the same FWB fixture previously permitted. This checks
    # INPUT, FORWARD and IPv6 INPUT without adding any nft accept/drop rules.
    case "${fw##*/}" in
        nft-ci-packet-tcp-input.fw|nft-ci-packet-udp-forward.fw|nft-ci-ipv6-icmp.fw)
            block_cases=$((block_cases + 1))
            if python3 ci/check-nft-packets.py "${fw##*/}" "$dir/start.nft" --expect-block; then
                echo "RESULT: PASS emergency-block-${fw##*/}"
            else
                block_failures=$((block_failures + 1))
                echo "RESULT: FAIL emergency-block-${fw##*/}" >&2
            fi
            ;;
    esac

    # Emergency recovery: apply the ORIGINAL FWB-generated start transaction
    # again, not a handmade allow rule. Prove that traffic blocked above is
    # permitted again and that unrelated tables survive the transition.
    case "${fw##*/}" in
        nft-ci-packet-tcp-input.fw|nft-ci-packet-udp-forward.fw|nft-ci-ipv6-icmp.fw)
            recovery_cases=$((recovery_cases + 1))
            { stage_owned_deletions; cat "$dir/start.nft"; } > "$dir/recover-transaction.nft"
            if nft -f "$dir/recover-transaction.nft" \
                && check_active_filters \
                && check_foreign \
                && python3 ci/check-nft-packets.py "${fw##*/}" "$dir/start.nft"; then
                echo "RESULT: PASS emergency-recovery-${fw##*/}"
            else
                recovery_failures=$((recovery_failures + 1))
                echo "RESULT: FAIL emergency-recovery-${fw##*/}" >&2
            fi
            ;;
    esac

    # Stop: remove FWB-owned tables only. Actual stop heredoc is generally
    # a comment; the staged deletions constitute its runtime operation.
    { stage_owned_deletions; cat "$dir/stop.nft"; } > "$dir/stop-transaction.nft"
    nft -f "$dir/stop-transaction.nft"
    check_no_owned_tables
    check_foreign

    # Exercise the generated *.fw ENTRYPOINTS, not only the nft heredocs.
    # These three actions perform no module loading, routing changes, or
    # interface configuration. Never run generated `start` here: unlike
    # block/status/stop it may modify kernel modules and network topology.
    case "${fw##*/}" in
        nft-ci-ipv6-ndp.fw)
            shell_lifecycle_cases=$((shell_lifecycle_cases + 1))
            check_shell_status 3 "$dir/generated-status-inactive.log"
            sh "$fw" block >"$dir/generated-block.log" 2>&1 || {
                cat "$dir/generated-block.log" >&2
                echo 'ERROR: generated .fw block action failed' >&2
                exit 1
            }
            for family in ip ip6; do
                nft list chain "$family" fwb_filter INPUT | grep -Eq 'policy drop' || {
                    echo "ERROR: generated shell block lacks $family INPUT drop" >&2
                    exit 1
                }
            done
            check_foreign
            check_shell_status 0 "$dir/generated-status-active.log"
            sh "$fw" stop >"$dir/generated-stop.log" 2>&1 || {
                cat "$dir/generated-stop.log" >&2
                echo 'ERROR: generated .fw stop action failed' >&2
                exit 1
            }
            check_no_owned_tables
            check_foreign
            check_shell_status 3 "$dir/generated-status-stopped.log"
            echo 'RESULT: PASS generated-shell-block-status-stop'
            # Unlike block/status/stop, generated start/reload configure
            # interfaces and routes. Run them in a SECOND fresh netns; never
            # attempt host-global module loading (CAP_SYS_MODULE is dropped).
            for required in unshare setpriv python3 ip; do
                command -v "$required" >/dev/null 2>&1 || {
                    echo "ERROR: required isolated start/reload tool missing: $required" >&2
                    exit 2
                }
            done
            FWB_START_PARENT_NETNS=$(readlink /proc/self/ns/net)
            export FWB_START_PARENT_NETNS
            unshare --net -- setpriv --no-new-privs --bounding-set=-sys_module,-sys_rawio,-sys_admin -- \
                sh ci/check-nft-start-reload.sh "$fw" > "$dir/start-reload.log" 2>&1 || {
                    cat "$dir/start-reload.log" >&2
                    echo 'ERROR: isolated generated start/reload failed' >&2
                    exit 1
                }
            cat "$dir/start-reload.log"
            grep -Fq 'RESULT: PASS generated-shell-start-reload' "$dir/start-reload.log" || {
                echo 'ERROR: start/reload success marker absent' >&2
                exit 1
            }
            shell_start_reload_cases=$((shell_start_reload_cases + 1))
            ;;
        nft-ci-ipv6-route-rollback.fw)
            for required in unshare setpriv python3 ip; do
                command -v "$required" >/dev/null 2>&1 || {
                    echo "ERROR: required isolated routing tool missing: $required" >&2
                    exit 2
                }
            done
            FWB_START_PARENT_NETNS=$(readlink /proc/self/ns/net)
            export FWB_START_PARENT_NETNS
            unshare --net -- setpriv --no-new-privs --bounding-set=-sys_module,-sys_rawio,-sys_admin -- \
                sh ci/check-nft-route-rollback.sh "$fw" > "$dir/route-rollback.log" 2>&1 || {
                    cat "$dir/route-rollback.log" >&2
                    echo 'ERROR: isolated generated routing rollback failed' >&2
                    exit 1
                }
            cat "$dir/route-rollback.log"
            grep -Fq 'RESULT: PASS generated-route-rollback' "$dir/route-rollback.log" || {
                echo 'ERROR: routing rollback success marker absent' >&2
                exit 1
            }
            shell_route_rollback_cases=$((shell_route_rollback_cases + 1))
            ;;
    esac

    echo 'PASS: start / rollback / reload / block / stop; foreign tables preserved'
done

if [ "${FWB_REQUIRE_PACKET_MATRIX:-0}" = 1 ] && [ "$packet_cases" -ne 6 ]; then
    echo "ERROR: expected six FWB packet test policies, got $packet_cases" >&2
    exit 1
fi
printf 'FWB packet matrix: %s cases; %s passed; %s failed\n' \
    "$packet_cases" "$((packet_cases - packet_failures))" "$packet_failures"
if [ "${FWB_REQUIRE_PACKET_MATRIX:-0}" = 1 ] && [ "$block_cases" -ne 3 ]; then
    echo "ERROR: expected three emergency packet probes, got $block_cases" >&2
    exit 1
fi
printf 'FWB emergency block matrix: %s cases; %s passed; %s failed\n' \
    "$block_cases" "$((block_cases - block_failures))" "$block_failures"
if [ "${FWB_REQUIRE_PACKET_MATRIX:-0}" = 1 ] && [ "$recovery_cases" -ne 3 ]; then
    echo "ERROR: expected three emergency recovery packet probes, got $recovery_cases" >&2
    exit 1
fi
printf 'FWB emergency recovery matrix: %s cases; %s passed; %s failed\n' \
    "$recovery_cases" "$((recovery_cases - recovery_failures))" "$recovery_failures"
if [ "${FWB_REQUIRE_PACKET_MATRIX:-0}" = 1 ] && [ "$shell_lifecycle_cases" -ne 1 ]; then
    echo "ERROR: expected one generated shell lifecycle test, got $shell_lifecycle_cases" >&2
    exit 1
fi
printf 'FWB generated shell lifecycle matrix: %s cases; %s passed; 0 failed\n' \
    "$shell_lifecycle_cases" "$shell_lifecycle_cases"
if [ "${FWB_REQUIRE_PACKET_MATRIX:-0}" = 1 ] && [ "$shell_start_reload_cases" -ne 1 ]; then
    echo "ERROR: expected one isolated generated start/reload test, got $shell_start_reload_cases" >&2
    exit 1
fi
printf 'FWB generated shell start/reload matrix: %s cases; %s passed; 0 failed\n' \
    "$shell_start_reload_cases" "$shell_start_reload_cases"
if [ "${FWB_REQUIRE_PACKET_MATRIX:-0}" = 1 ] && [ "$shell_route_rollback_cases" -ne 1 ]; then
    echo "ERROR: expected one generated routing rollback test, got $shell_route_rollback_cases" >&2
    exit 1
fi
printf 'FWB generated routing rollback matrix: %s cases; %s passed; 0 failed\n' \
    "$shell_route_rollback_cases" "$shell_route_rollback_cases"
[ "$packet_failures" -eq 0 ] && [ "$block_failures" -eq 0 ] && [ "$recovery_failures" -eq 0 ] || exit 1
echo 'Native nftables kernel transaction and coexistence tests passed in isolated network namespace.'
