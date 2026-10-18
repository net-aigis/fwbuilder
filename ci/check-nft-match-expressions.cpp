// Native nftables match regression tests; only depends on the shared utils.
#include "../src/nftlib/nft_utils.h"
#include <cassert>
#include <iostream>
#include <stdexcept>
#include <string>

using fwcompiler::nft_utils::dscpMatchExpression;
using fwcompiler::nft_utils::fragmentMatchExpression;
using fwcompiler::nft_utils::macSourceMatchExpression;
using fwcompiler::nft_utils::timeMatchExpression;

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
                  << "add rule ip fwb_nft_match_test INPUT " << timeMatchExpression("08:00", "18:30", "1,2,3,4,5", false) << " counter accept\n"
                  << "add rule ip fwb_nft_match_test INPUT " << timeMatchExpression("00:00", "23:59", "0,6", false) << " counter accept\n"
                  // The mangle compiler's automatic connmark restore uses
                  // this expression, not the legacy CONNMARK target.
                  << "add table ip fwb_nft_mark_test\n"
                  << "add chain ip fwb_nft_mark_test PREROUTING { type filter hook prerouting priority -150; }\n"
                  << "add chain ip fwb_nft_mark_test OUTPUT { type filter hook output priority -150; }\n"
                  << "add rule ip fwb_nft_mark_test PREROUTING meta mark set ct mark\n"
                  << "add rule ip fwb_nft_mark_test OUTPUT meta mark set ct mark\n"
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
    assert(timeMatchExpression("09:00", "17:30", "1,2,3,4,5", false) ==
           "meta hour \"09:00\"-\"17:30\" meta day { 1, 2, 3, 4, 5 }");
    assert(timeMatchExpression("00:00", "23:59", "0,6,7", false) ==
           "meta hour \"00:00\"-\"23:59\" meta day { 0, 6, 0 }");
    assert(timeMatchExpression("", "", "", false).empty());
    assert(timeMatchExpression("", "", "3", false) == "meta day { 3 }");
    const auto invalidTime = [](const std::string &from, const std::string &to,
                                const std::string &days, bool kernel_tz) {
        bool threw = false;
        try { (void)timeMatchExpression(from, to, days, kernel_tz); }
        catch (const std::invalid_argument &) { threw = true; }
        assert(threw);
    };
    invalidTime("09:00", "17:00", "", true);
    invalidTime("23:00", "01:00", "", false);
    invalidTime("24:00", "23:59", "", false);
    invalidTime("08:60", "09:00", "", false);
    invalidTime("8:00", "09:00", "", false);
    invalidTime("08:00;drop", "09:00", "", false);
    invalidTime("08:00", "", "", false);
    invalidTime("", "09:00", "", false);
    invalidTime("08:00", "09:00", "Monday", false);
    invalidTime("08:00", "09:00", "0;drop", false);
    invalidTime("08:00", "09:00", "8", false);
    invalidTime("08:00", "09:00", "1,,3", false);
    invalidTime("08:00", "09:00", "1,", false);
    invalidTime("08:00", "09:00", ",1", false);
}
