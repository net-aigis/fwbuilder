#!/usr/bin/env python3
"""Create real FWB XML regression cases from the preserved nft-test project.

No hand-written schema guesses: every variant starts from the checked-in FWB
project and references real service, address and interval objects in that file.
Generated XML belongs only to disposable CI artifacts, not the repository.
"""
import argparse
from copy import deepcopy
from pathlib import Path
import xml.etree.ElementTree as ET

NS = 'http://www.fwbuilder.org/1.0/'
ET.register_namespace('', NS)


def tag(name):
    return '{%s}%s' % (NS, name)


def only(root, expression):
    found = root.findall(expression)
    if len(found) != 1:
        raise ValueError('%s: expected exactly one object; found %d' % (expression, len(found)))
    return found[0]


def replace_ref(parent, child, ref):
    element = only(parent, './' + tag(child))
    found = list(element)
    if len(found) != 1 or 'ref' not in found[0].attrib:
        raise ValueError('unexpected FWB rule element ' + child)
    found[0].set('ref', ref)


def prepare(tree):
    root = tree.getroot()
    fw = only(root, ".//%s[@name='nft-test']" % tag('Firewall'))
    if fw.get('platform') != 'nftables':
        raise ValueError('original project no longer uses the nftables platform')
    policy = only(fw, './%s' % tag('Policy'))
    nat = only(fw, './%s' % tag('NAT'))
    pr = only(policy, "./%s[@id='id9001X30989']" % tag('PolicyRule'))
    nr = only(nat, "./%s[@id='id2842X30989']" % tag('NATRule'))
    # Guard the baseline test semantics before modifying cloned projects.
    if only(pr, './' + tag('Srv'))[0].get('ref') != 'tcp-HTTP':
        raise ValueError('baseline policy service changed')
    if only(nr, './' + tag('OSrv'))[0].get('ref') != 'sysid1':
        raise ValueError('baseline NAT service changed')
    return root, fw, pr, nr


def case_ipv6(tree):
    root, fw, pr, _ = prepare(tree)
    # -6 selects the compiler pass, but RuleSet::matchingAddressFamily()
    # also requires an IPv6-enabled Policy. The preserved project is IPv4.
    policy = only(fw, './' + tag('Policy'))
    if (policy.get('ipv4_rule_set'), policy.get('ipv6_rule_set')) != ('False', 'False'):
        raise ValueError('unexpected baseline policy address family')
    policy.set('ipv4_rule_set', 'False')
    policy.set('ipv6_rule_set', 'True')
    # The preserved Policy begins with an unconditional deny rule. For the
    # IPv6 fixture, place the specific ICMPv6 allow BEFORE that fallback deny;
    # otherwise the FWB shadowing check correctly rejects the allow rule.
    fallback = only(policy, "./%s[@id='id2830X30989']" % tag('PolicyRule'))
    if (list(policy)[:2] != [fallback, pr]
            or fallback.get('position') != '0'
            or fallback.get('action') != 'Deny'
            or pr.get('position') != '1'
            or pr.get('action') != 'Accept'):
        raise ValueError('unexpected baseline policy order: cannot reorder IPv6 fixture')
    policy.remove(pr)
    policy.insert(0, pr)
    pr.set('position', '0')
    fallback.set('position', '1')
    replace_ref(pr, 'Src', 'id2088X75851')  # RFC 3849 documentation IPv6 /32
    only(pr, './' + tag('Src')).set('neg', 'False')
    replace_ref(pr, 'Dst', 'sysid0')
    replace_ref(pr, 'Srv', 'ipv6-icmp-ping_request')
    pr.set('direction', 'Both')
    # Stateful ICMPv6 is automatically converted to stateless by the policy
    # compiler. That emits a warning and a non-zero FWCOMPILER_WARNING status
    # even after writing a complete script. Declare the intended semantics
    # explicitly instead of treating compiler warnings as successful builds.
    rule_options = only(pr, './' + tag('PolicyRuleOptions'))
    stateless = only(rule_options, "./%s[@name='stateless']" % tag('Option'))
    if (stateless.text or '').strip() != 'False':
        raise ValueError('unexpected baseline IPv6 policy statefulness')
    stateless.text = 'True'
    # Add documentation-only IPv6 addresses to the existing FWB interfaces.
    for name, address in [('eth0', '2001:db8:1::1'), ('eth1', '2001:db8:2::1')]:
        iface = only(fw, "./%s[@name='%s']" % (tag('Interface'), name))
        v6 = ET.Element(tag('IPv6'), {
            'id': 'fwb-ci-ipv6-' + name, 'name': 'ci-' + name + '-v6',
            'comment': 'CI documentation address', 'ro': 'False',
            'address': address, 'netmask': '64',
        })
        iface.insert(len(iface) - 1, v6)  # immediately before InterfaceOptions


def case_ipv6_ndp(tree):
    """IPv6 echo via dynamic neighbor discovery, with explicit FWB NS/NA permits."""
    case_ipv6(tree)
    root = tree.getroot()
    fw = only(root, ".//%s[@name='nft-test']" % tag('Firewall'))
    policy = only(fw, './' + tag('Policy'))
    echo = only(policy, "./%s[@id='id9001X30989']" % tag('PolicyRule'))
    deny = only(policy, "./%s[@id='id2830X30989']" % tag('PolicyRule'))
    if list(policy)[:2] != [echo, deny]:
        raise ValueError('unexpected IPv6 allow/fallback order for NDP fixture')
    # Keep the echo allow restricted to the documentation source prefix.
    # Neighbor discovery can legitimately originate from :: or fe80::/10,
    # so its two *separate* rules need wildcard source/destination matches.
    for pos, suffix, service in (
            (1, 'ns', 'ipv6-icmp-neighbrsol'),
            (2, 'na', 'ipv6-icmp-neighbradv')):
        rule = deepcopy(echo)
        rule.set('id', 'fwb-ci-ndp-' + suffix)
        rule.set('position', str(pos))
        rule.set('comment', 'CI: allow ICMPv6 neighbor ' + suffix.upper())
        replace_ref(rule, 'Src', 'sysid0')
        replace_ref(rule, 'Dst', 'sysid0')
        replace_ref(rule, 'Srv', service)
        policy.insert(pos, rule)
    deny.set('position', '3')


def case_udp_workhours(tree):
    _, _, pr, _ = prepare(tree)
    replace_ref(pr, 'Srv', 'udp-DNS')
    replace_ref(pr, 'When', 'int-workhours')


def case_policy_fragments(tree):
    _, _, pr, _ = prepare(tree)
    replace_ref(pr, 'Srv', 'ip-IP_Fragments')


def case_nat_fragments(tree):
    _, _, _, nr = prepare(tree)
    replace_ref(nr, 'OSrv', 'ip-IP_Fragments')


def case_reject_policy_options(tree):
    _, _, pr, _ = prepare(tree)
    replace_ref(pr, 'Srv', 'ip-RR')  # IPv4 record-route option, unsupported


def case_reject_nat_options(tree):
    _, _, _, nr = prepare(tree)
    replace_ref(nr, 'OSrv', 'ip-RR')


def case_reject_timezone(tree):
    _, fw, pr, _ = prepare(tree)
    replace_ref(pr, 'When', 'int-workhours')
    opts = only(fw, './' + tag('FirewallOptions'))
    existing = opts.findall("./%s[@name='use_kerneltz']" % tag('Option'))
    if len(existing) > 1:
        raise ValueError('duplicate timezone options')
    opt = existing[0] if existing else ET.SubElement(opts, tag('Option'), {'name': 'use_kerneltz'})
    opt.text = 'True'


def prepare_packet_policy(tree, service):
    """Build an ordered allow-service / deny-all Policy from preserved objects."""
    _, fw, allow, _ = prepare(tree)
    policy = only(fw, './' + tag('Policy'))
    deny = only(policy, "./%s[@id='id2830X30989']" % tag('PolicyRule'))
    if list(policy)[:2] != [deny, allow] or (deny.get('action'), allow.get('action')) != ('Deny', 'Accept'):
        raise ValueError('unexpected baseline Policy ordering')
    policy.remove(allow)
    policy.insert(0, allow)
    allow.set('position', '0')
    deny.set('position', '1')
    allow.set('direction', 'Both')
    replace_ref(allow, 'Src', 'sysid0')
    replace_ref(allow, 'Dst', 'sysid0')
    replace_ref(allow, 'Srv', service)
    for elem in ('Src', 'Dst', 'Srv'):
        only(allow, './' + tag(elem)).set('neg', 'False')
    # Logging is not part of this packet decision test.
    deny.set('log', 'False')
    return fw


def case_packet_tcp_input(tree):
    prepare_packet_policy(tree, 'tcp-HTTP')


def case_packet_udp_forward(tree):
    prepare_packet_policy(tree, 'udp-DNS')


def case_packet_snat(tree):
    fw = prepare_packet_policy(tree, 'udp-DNS')
    nat = only(fw, './' + tag('NAT'))
    snat = only(nat, "./%s[@id='id2842X30989']" % tag('NATRule'))
    if snat.get('action') != 'Translate':
        raise ValueError('baseline source NAT rule changed')
    # 192.168.1.0/24 -> 192.0.2.100; preserved project contains both
    # address objects. Disabled unrelated DNAT/SNAT rules cannot interfere.
    replace_ref(snat, 'OSrc', 'id3DC75CE7-1')
    replace_ref(snat, 'ODst', 'sysid0')
    replace_ref(snat, 'OSrv', 'sysid1')
    replace_ref(snat, 'TSrc', 'id2864X30989')
    replace_ref(snat, 'TDst', 'sysid0')
    replace_ref(snat, 'TSrv', 'sysid1')
    only(snat, './' + tag('OSrc')).set('neg', 'False')
    for rule in nat.findall('./' + tag('NATRule')):
        if rule is not snat:
            rule.set('disabled', 'True')


def case_packet_dnat(tree):
    """WAN TCP/80 to public .101 must reach internal .100 via FWB DNAT."""
    fw = prepare_packet_policy(tree, 'tcp-HTTP')
    nat = only(fw, './' + tag('NAT'))
    dnat = only(nat, "./%s[@id='id11861X30989']" % tag('NATRule'))
    if dnat.get('action') != 'Translate':
        raise ValueError('baseline destination NAT rule changed')
    # Use the real original FWB destination-NAT rule and existing address
    # objects; restrict translation to TCP/80 so the default deny is testable.
    if (only(dnat, './' + tag('ODst'))[0].get('ref') != 'id11875X30989'
            or only(dnat, './' + tag('TDst'))[0].get('ref') != 'id11890X30989'):
        raise ValueError('baseline DNAT address objects changed')
    replace_ref(dnat, 'OSrc', 'sysid0')
    replace_ref(dnat, 'OSrv', 'tcp-HTTP')
    replace_ref(dnat, 'TSrc', 'sysid0')
    replace_ref(dnat, 'TSrv', 'sysid1')
    for elem in ('OSrc', 'ODst', 'OSrv'):
        only(dnat, './' + tag(elem)).set('neg', 'False')
    for rule in nat.findall('./' + tag('NATRule')):
        rule.set('disabled', 'False' if rule is dnat else 'True')


def case_dynamic_address_sets(tree):
    """Real FWB AddressTable: an IPv4 allowlist with atomic runtime sets."""
    fw = prepare_packet_policy(tree, 'tcp-HTTP')
    policy = only(fw, './' + tag('Policy'))
    allow = only(policy, "./%s[@id='id9001X30989']" % tag('PolicyRule'))
    replace_ref(allow, 'Src', 'id3002X5927')
    table = only(tree.getroot(), ".//%s[@id='id3002X5927']" % tag('AddressTable'))
    if table.get('run_time') != 'True' or table.get('name') != 'bad_guys':
        raise ValueError('unexpected baseline run-time address table')
    table.set('filename', '/tmp/fwb-pr6-ci-address-set.data')
    opts = only(fw, './' + tag('FirewallOptions'))
    matches = opts.findall("./%s[@name='use_nft_sets']" % tag('Option'))
    if len(matches) > 1:
        raise ValueError('duplicate use_nft_sets options')
    option = matches[0] if matches else ET.SubElement(opts, tag('Option'), {'name': 'use_nft_sets'})
    option.text = 'True'


CASES = {
    'ipv6-icmp': case_ipv6,
    'ipv6-ndp': case_ipv6_ndp,
    'udp-workhours': case_udp_workhours,
    'policy-fragments': case_policy_fragments,
    'nat-fragments': case_nat_fragments,
    'reject-policy-options': case_reject_policy_options,
    'reject-nat-options': case_reject_nat_options,
    'reject-timezone': case_reject_timezone,
    'packet-tcp-input': case_packet_tcp_input,
    'packet-udp-forward': case_packet_udp_forward,
    'packet-snat': case_packet_snat,
    'packet-dnat': case_packet_dnat,
    'dynamic-address-sets': case_dynamic_address_sets,
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('baseline', type=Path)
    parser.add_argument('destination', type=Path)
    args = parser.parse_args()
    args.destination.mkdir(parents=True, exist_ok=True)
    for name, mutate in CASES.items():
        tree = ET.parse(args.baseline)
        root = tree.getroot()
        if root.tag != tag('FWObjectDatabase'):
            raise ValueError('not an FWB object database')
        mutate(tree)
        if name in ('ipv6-icmp', 'ipv6-ndp'):
            fw = only(root, ".//%s[@name='nft-test']" % tag('Firewall'))
            policy = only(fw, './' + tag('Policy'))
            if (policy.get('ipv4_rule_set'), policy.get('ipv6_rule_set')) != ('False', 'True'):
                raise ValueError('IPv6 fixture is not an IPv6 rule set')
            rules = policy.findall('./' + tag('PolicyRule'))
            expected = [('id9001X30989', '0', 'Accept'),
                        ('id2830X30989', '1', 'Deny')]
            if name == 'ipv6-ndp':
                expected = [('id9001X30989', '0', 'Accept'),
                            ('fwb-ci-ndp-ns', '1', 'Accept'),
                            ('fwb-ci-ndp-na', '2', 'Accept'),
                            ('id2830X30989', '3', 'Deny')]
                for rule, service in zip(rules[1:3],
                                         ('ipv6-icmp-neighbrsol', 'ipv6-icmp-neighbradv')):
                    if (only(rule, './' + tag('Src'))[0].get('ref') != 'sysid0'
                            or only(rule, './' + tag('Dst'))[0].get('ref') != 'sysid0'
                            or only(rule, './' + tag('Srv'))[0].get('ref') != service):
                        raise ValueError('invalid NDP rule references')
            actual = [(r.get('id'), r.get('position'), r.get('action')) for r in rules]
            if actual != expected:
                raise ValueError('IPv6 fixture has an unexpected policy rule order: ' + repr(actual))
            allow = rules[0]
            opts = only(allow, './' + tag('PolicyRuleOptions'))
            if (only(opts, "./%s[@name='stateless']" % tag('Option')).text != 'True'):
                raise ValueError('ICMPv6 allow must be explicitly stateless')
        id_values = [elem.attrib['id'] for elem in root.iter() if 'id' in elem.attrib]
        if len(id_values) != len(set(id_values)):
            raise ValueError('duplicated FWB ids in ' + name)
        out = args.destination / (name + '.fwb')
        with out.open('wb') as stream:
            stream.write(b'<?xml version="1.0" encoding="utf-8"?>\n')
            stream.write(b'<!DOCTYPE FWObjectDatabase SYSTEM "fwbuilder.dtd">\n')
            stream.write(ET.tostring(root, encoding='utf-8'))
            stream.write(b'\n')
        if ET.parse(out).getroot().tag != tag('FWObjectDatabase'):
            raise ValueError('invalid generated fixture ' + name)
        print('FWB XML fixture: ' + name)


if __name__ == '__main__':
    main()
