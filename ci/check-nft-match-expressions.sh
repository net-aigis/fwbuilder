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
    # Regression for the actual native SNAT address+port printer.  IPv6
    # address brackets are required when appending a translated port.
    cat > "$fixture" <<'FWB_PR6_NAT_CONNCOUNT'
add table ip6 fwb_pr6_snat_check
add chain ip6 fwb_pr6_snat_check POSTROUTING { type nat hook postrouting priority srcnat; policy accept; }
add rule ip6 fwb_pr6_snat_check POSTROUTING meta l4proto tcp tcp dport 443 snat to [2001:db8:3::1]:55000
add table ip fwb_pr6_conncount_check
add chain ip fwb_pr6_conncount_check INPUT { type filter hook input priority 0; policy accept; }
add rule ip fwb_pr6_conncount_check INPUT tcp dport 443 ct count over 5 drop
add rule ip fwb_pr6_conncount_check INPUT tcp dport 80 ct count 5 accept
FWB_PR6_NAT_CONNCOUNT
    nft --check --file "$fixture"
    # Make sure the native printers actually use the syntax just checked.
    grep -Fq 'tsrc->getAddressPtr()->isV6()' src/nftlib/NATCompiler_PrintRule_nft.cpp
    grep -Fq 'ostr << " ct count over " << lim' src/nftlib/PolicyCompiler_PrintRule_nft.cpp
    # A single explicit dynamic set must be reusable by multiple policy
    # chains. Implicit `meter` declarations generated EOPNOTSUPP/EBUSY in CI.
    cat > "$fixture" <<'FWB_PR6_HASHLIMIT'
add table ip fwb_pr6_hashlimit_check
add chain ip fwb_pr6_hashlimit_check INPUT { type filter hook input priority 0; policy accept; }
add chain ip fwb_pr6_hashlimit_check FORWARD { type filter hook forward priority 0; policy accept; }
add set ip fwb_pr6_hashlimit_check fwb_ci_srcip { type ipv4_addr; size 65535; flags dynamic,timeout; timeout 3000ms; }
add set ip fwb_pr6_hashlimit_check fwb_ci_srcip_dstport { type ipv4_addr . inet_service; size 65535; flags dynamic,timeout; timeout 3000ms; }
add rule ip fwb_pr6_hashlimit_check INPUT tcp dport 80 update @fwb_ci_srcip { ip saddr limit rate 8/second burst 4 packets } accept
add rule ip fwb_pr6_hashlimit_check INPUT tcp dport 80 update @fwb_ci_srcip_dstport { ip saddr . tcp dport limit rate 8/second burst 4 packets } accept
add rule ip fwb_pr6_hashlimit_check FORWARD tcp dport 80 update @fwb_ci_srcip_dstport { ip saddr . tcp dport limit rate 8/second burst 4 packets } accept
add table ip fwb_pr6_hashlimit_udp
add chain ip fwb_pr6_hashlimit_udp INPUT { type filter hook input priority 0; policy accept; }
add set ip fwb_pr6_hashlimit_udp fwb_ci_udp_port { type ipv4_addr . inet_service; size 65535; flags dynamic,timeout; timeout 3000ms; }
add rule ip fwb_pr6_hashlimit_udp INPUT udp dport 53 update @fwb_ci_udp_port { ip saddr . udp dport limit rate 8/second burst 4 packets } accept
add table ip6 fwb_pr6_hashlimit6_check
add chain ip6 fwb_pr6_hashlimit6_check INPUT { type filter hook input priority 0; policy accept; }
add set ip6 fwb_pr6_hashlimit6_check fwb_ci_srcip { type ipv6_addr; size 65535; flags dynamic,timeout; timeout 3000ms; }
add set ip6 fwb_pr6_hashlimit6_check fwb_ci_ip6_port { type ipv6_addr . inet_service; size 65535; flags dynamic,timeout; timeout 3000ms; }
add rule ip6 fwb_pr6_hashlimit6_check INPUT tcp dport 80 update @fwb_ci_srcip { ip6 saddr limit rate 8/second burst 4 packets } accept
add rule ip6 fwb_pr6_hashlimit6_check INPUT tcp dport 80 update @fwb_ci_ip6_port { ip6 saddr . tcp dport limit rate 8/second burst 4 packets } accept
FWB_PR6_HASHLIMIT
    nft --check --file "$fixture"
    echo 'PASS: native IPv4/IPv6 per-key hashlimit named dynamic-set grammar'
    echo 'PASS: IPv6 SNAT port and connlimit grammar'
    echo 'PASS: native IPv4 options grammar'     echo 'PASS: native DSCP, fragment, MAC and time expressions accepted by nft --check'
elif [ "${FWB_REQUIRE_NFT:-0}" = 1 ]; then
    echo 'ERROR: nft command required for grammar check' >&2
    exit 1
else
    echo 'SKIP: nft grammar check requires nft binary (performed in CI)'
fi
