#!/usr/bin/env python3
"""Create real FWB XML regression cases from the preserved nft-test project.

No hand-written schema guesses: every variant starts from the checked-in FWB
project and references real service, address and interval objects in that file.
Generated XML belongs only to disposable CI artifacts, not the repository.
"""
import argparse
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
    replace_ref(pr, 'Src', 'id2088X75851')  # RFC 3849 documentation IPv6 /32
    only(pr, './' + tag('Src')).set('neg', 'False')
    replace_ref(pr, 'Dst', 'sysid0')
    replace_ref(pr, 'Srv', 'ipv6-icmp-ping_request')
    pr.set('direction', 'Both')
    # Add documentation-only IPv6 addresses to the existing FWB interfaces.
    for name, address in [('eth0', '2001:db8:1::1'), ('eth1', '2001:db8:2::1')]:
        iface = only(fw, "./%s[@name='%s']" % (tag('Interface'), name))
        v6 = ET.Element(tag('IPv6'), {
            'id': 'fwb-ci-ipv6-' + name, 'name': 'ci-' + name + '-v6',
            'comment': 'CI documentation address', 'ro': 'False',
            'address': address, 'netmask': '64',
        })
        iface.insert(len(iface) - 1, v6)  # immediately before InterfaceOptions


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


CASES = {
    'ipv6-icmp': case_ipv6,
    'udp-workhours': case_udp_workhours,
    'policy-fragments': case_policy_fragments,
    'nat-fragments': case_nat_fragments,
    'reject-policy-options': case_reject_policy_options,
    'reject-nat-options': case_reject_nat_options,
    'reject-timezone': case_reject_timezone,
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
        if name == 'ipv6-icmp':
            fw = only(root, ".//%s[@name='nft-test']" % tag('Firewall'))
            policy = only(fw, './' + tag('Policy'))
            if (policy.get('ipv4_rule_set'), policy.get('ipv6_rule_set')) != ('False', 'True'):
                raise ValueError('IPv6 fixture is not an IPv6 rule set')
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
