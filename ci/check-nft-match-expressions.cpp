// Native nftables match regression tests; only depends on the shared utils.
#include "../src/nftlib/nft_utils.h"
#include <cassert>
#include <iostream>
#include <stdexcept>
#include <string>

using fwcompiler::nft_utils::dscpMatchExpression;
using fwcompiler::nft_utils::fragmentMatchExpression;
using fwcompiler::nft_utils::macSourceMatchExpression;

static void rejected(const std::string &input)
{
    bool threw = false;
    try { (void)dscpMatchExpression(input, false); }
    catch (const std::invalid_argument &) { threw = true; }
    assert(threw);
}

static void rejectedMac(const std::string &input)
{
    bool threw = false;
    try { (void)macSourceMatchExpression(input, false); }
    catch (const std::invalid_argument &) { threw = true; }
    assert(threw);
}

int main(int argc, char **argv)
{
    if (argc == 2 && std::string(argv[1]) == "--grammar")
    {
        // Generate a real nft --check transaction from the SAME helpers
        // exercised by the C++ unit tests; never install these rules.
        std::cout << "add table ip fwb_nft_match_test\n"
                  << "add chain ip fwb_nft_match_test INPUT { type filter hook input priority 0; policy accept; }\n"
                  << "add rule ip fwb_nft_match_test INPUT " << dscpMatchExpression("EF", false) << " counter accept\n"
                  << "add rule ip fwb_nft_match_test INPUT " << dscpMatchExpression("46", false) << " counter accept\n"
                  << "add rule ip fwb_nft_match_test INPUT " << fragmentMatchExpression(false) << " counter drop\n"
                  << "add rule ip fwb_nft_match_test INPUT " << macSourceMatchExpression("00:11:22:33:44:55", false) << " counter accept\n"
                  << "add rule ip fwb_nft_match_test INPUT " << macSourceMatchExpression("00:11:22:33:44:55", true) << " counter drop\n"
                  << "add table ip6 fwb_nft_match_test\n"
                  << "add chain ip6 fwb_nft_match_test INPUT { type filter hook input priority 0; policy accept; }\n"
                  << "add rule ip6 fwb_nft_match_test INPUT " << dscpMatchExpression("AF23", true) << " counter accept\n"
                  << "add rule ip6 fwb_nft_match_test INPUT " << fragmentMatchExpression(true) << " counter drop\n";
        return 0;
    }
    assert(argc == 1);

    assert(dscpMatchExpression("EF", false) == "ip dscp ef");
    assert(dscpMatchExpression("AF23", true) == "ip6 dscp af23");
    assert(dscpMatchExpression("BE", false) == "ip dscp cs0");
    assert(dscpMatchExpression("CS7", true) == "ip6 dscp cs7");
    assert(dscpMatchExpression("46", false) == "ip dscp 46");
    assert(dscpMatchExpression("0x2e", true) == "ip6 dscp 0x2e");
    assert(dscpMatchExpression("0", false) == "ip dscp 0");
    assert(dscpMatchExpression("63", true) == "ip6 dscp 63");
    for (const auto &v : {"", "-1", "64", "0x40", "0x", "0xGG", "AF44", "CS8", "BE;drop", "1 2", "18446744073709551616"}) rejected(v);
    assert(fragmentMatchExpression(false) == "ip frag-off & 0x1fff != 0");
    assert(fragmentMatchExpression(true) == "frag more-fragments 1");
    assert(macSourceMatchExpression("00:11:aa:BB:cc:FF", false) == "ether saddr 00:11:aa:BB:cc:FF");
    assert(macSourceMatchExpression("00:11:aa:BB:cc:FF", true) == "ether saddr != 00:11:aa:BB:cc:FF");
    for (const auto &v : {"", "00:11:22:33:44", "00-11-22-33-44-55", "gg:11:22:33:44:55", "00:11:22:33:44:5x", "00:11:22:33:44:55 drop"}) rejectedMac(v);
}
