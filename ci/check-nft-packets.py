#!/usr/bin/env python3
"""End-to-end nft packet decisions from REAL fwb_nft XML-generated rules.

Called only by check-nft-runtime.sh *inside* an isolated network namespace.
Peers get separate anonymous network namespaces (no host netns names/mounts).
The installed nftables policy is NEVER replaced or manufactured by this test.
"""
import json
import os
from pathlib import Path
import re
import socket
import subprocess
import sys
import tempfile
import time


CASES = {
    'nft-ci-packet-tcp-input.fw': (
        'tcp-input', r'^add rule ip fwb_filter INPUT .*tcp dport 80 .*accept\s*$'),
    'nft-ci-packet-udp-forward.fw': (
        'udp-forward', r'^add rule ip fwb_filter FORWARD .*udp dport 53 .*accept\s*$'),
    'nft-ci-packet-snat.fw': (
        'snat', r'^add rule ip fwb_nat POSTROUTING .*snat to 192\.0\.2\.100\s*$'),
    'nft-ci-packet-dnat.fw': (
        'dnat', r'^add rule ip fwb_nat PREROUTING .*dnat to 192\.168\.1\.100\s*$'),
    'nft-ci-ipv6-icmp.fw': (
        'icmpv6', r'^add rule ip6 fwb_filter INPUT .*ip6 saddr 2001:db8::/32 .*icmpv6 type 128 .*accept\s*$'),
    'nft-ci-ipv6-ndp.fw': (
        'icmpv6-ndp', r'^add rule ip6 fwb_filter INPUT .*ip6 saddr 2001:db8::/32 .*icmpv6 type 128 .*accept\s*$'),
}


def call(*args, capture=False):
    result = subprocess.run(args, text=True, capture_output=True, check=False)
    if result.returncode:
        raise RuntimeError('command failed (%d): %s\n%s%s' % (
            result.returncode, ' '.join(map(str, args)), result.stdout, result.stderr))
    return result.stdout.strip() if capture else None


def peer(pid, *args, capture=False):
    return call('nsenter', '-t', str(pid), '-n', '--', *args, capture=capture)


def worker():
    role = sys.argv[2]
    address = sys.argv[3]
    port = int(sys.argv[4])
    result = Path(sys.argv[5])
    if role == 'udp-server':
        # Only the SNAT fixture sends an application reply. This checks that
        # conntrack translates the return packet back to the real LAN client.
        reply = len(sys.argv) > 6 and sys.argv[6] == '--reply'
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
            s.settimeout(1.6)
            s.bind((address, port))
            result.with_suffix('.ready').touch()
            try:
                data, sender = s.recvfrom(1024)
                result.write_text(json.dumps({
                    'payload': data.decode('ascii'), 'source': sender[0]}))
                if reply:
                    s.sendto(b'FWB-PACKET-REPLY', sender)
            except socket.timeout:
                result.write_text(json.dumps({'timeout': True}))
    elif role == 'tcp-server':
        reply = len(sys.argv) > 6 and sys.argv[6] == '--reply'
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        s.bind((address, port))
        s.listen(1)
        s.settimeout(1.6)
        result.with_suffix('.ready').touch()
        try:
            connection, _ = s.accept()
            connection.settimeout(0.7)
            data = connection.recv(1024)
            result.write_text(json.dumps({
                'payload': data.decode('ascii'),
                'local': connection.getsockname()[0],
                'remote': connection.getpeername()[0],
            }))
            if reply:
                connection.sendall(b'FWB-PACKET-REPLY')
            connection.close()
        except socket.timeout:
            result.write_text(json.dumps({'timeout': True}))
    elif role == 'udp-client':
        reply = len(sys.argv) > 6 and sys.argv[6] == '--reply'
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
            if reply:
                s.settimeout(2.0)
            s.sendto(b'FWB-PACKET-PROBE', (address, port))
            if reply:
                try:
                    packet, sender = s.recvfrom(1024)
                except socket.timeout:
                    result.write_text(json.dumps({'timeout': True}))
                else:
                    result.write_text(json.dumps({
                        'payload': packet.decode('ascii'), 'source': sender[0]}))
    elif role == 'tcp-client':
        reply = len(sys.argv) > 6 and sys.argv[6] == '--reply'
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(0.8)
            try:
                s.connect((address, port))
            except (OSError, socket.timeout):
                result.write_text('connection-failed')
                return
            s.sendall(b'FWB-PACKET-PROBE')
            if reply:
                received = s.recv(1024)
                result.write_text(json.dumps({
                    'reply': received.decode('ascii'),
                    'peer': s.getpeername()[0],
                }))
            else:
                result.write_text('connected')
    else:
        raise ValueError('Unknown worker: ' + role)


def wait_ready(path, proc):
    ready = path.with_suffix('.ready')
    for _ in range(120):
        if ready.exists():
            return
        if proc.poll() is not None:
            raise RuntimeError('listener exited before ready, status=' + str(proc.returncode))
        time.sleep(0.02)
    raise RuntimeError('listener not ready: ' + str(path))


def probe_udp(namespace_server, namespace_client, bind, destination, port, expect, source=None, reply=False):
    with tempfile.TemporaryDirectory(prefix='fwb-nft-udp-') as directory:
        result = Path(directory) / 'receiver.json'
        returned = Path(directory) / 'client.json'
        if reply and (not expect or source is None):
            raise ValueError('UDP round-trip requires an allowed SNAT probe')
        flag = ('--reply',) if reply else ()
        prefix = ('nsenter', '-t', str(namespace_server), '-n', '--') if namespace_server else ()
        server = subprocess.Popen((*prefix, sys.executable, __file__, '--worker',
                                   'udp-server', bind, str(port), str(result), *flag),
                                  stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, text=True)
        try:
            wait_ready(result, server)
            peer(namespace_client, sys.executable, __file__, '--worker',
                 'udp-client', destination, str(port), str(returned), *flag)
            _, err = server.communicate(timeout=4)
            if server.returncode:
                raise RuntimeError('UDP listener failed: ' + err)
            received = json.loads(result.read_text())
            if expect:
                assert received.get('payload') == 'FWB-PACKET-PROBE', (
                    'allowed UDP/%s never arrived: %s' % (port, received))
                if source is not None:
                    assert received.get('source') == source, (
                        'SNAT source mismatch: expected %s, got %s' % (source, received))
                if reply:
                    returned_packet = json.loads(returned.read_text())
                    assert returned_packet.get('payload') == 'FWB-PACKET-REPLY', (
                        'SNAT return traffic missing: %s' % returned_packet)
                    assert returned_packet.get('source') == destination, (
                        'SNAT return traffic from unexpected IP: %s' % returned_packet)
            else:
                assert received.get('timeout') is True, (
                    'denied UDP/%s reached destination: %s' % (port, received))
        finally:
            if server.poll() is None:
                server.kill()
                server.wait()


def probe_tcp(namespace_client, destination, port, expect, *,
              namespace_server=None, bind=None, reply=False, client_source=None):
    if reply and (not expect or bind is None or client_source is None):
        raise ValueError('TCP DNAT round-trip requires an allowed peer listener')
    with tempfile.TemporaryDirectory(prefix='fwb-nft-tcp-') as directory:
        result = Path(directory) / 'listener.json'
        attempt = Path(directory) / 'connect.out'
        server_bind = bind if bind is not None else destination
        server_prefix = (('nsenter', '-t', str(namespace_server), '-n', '--')
                         if namespace_server is not None else ())
        flag = ('--reply',) if reply else ()
        server = subprocess.Popen((*server_prefix, sys.executable, __file__, '--worker',
                                   'tcp-server', server_bind, str(port), str(result), *flag),
                                  stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, text=True)
        try:
            wait_ready(result, server)
            peer(namespace_client, sys.executable, __file__, '--worker',
                 'tcp-client', destination, str(port), str(attempt), *flag)
            _, err = server.communicate(timeout=4)
            if server.returncode:
                raise RuntimeError('TCP listener failed: ' + err)
            received = json.loads(result.read_text())
            connected = attempt.read_text()
            if expect:
                if reply:
                    response = json.loads(connected)
                    assert received.get('payload') == 'FWB-PACKET-PROBE', (
                        'DNAT request missing at backend: ' + repr(received))
                    assert received.get('local') == server_bind, (
                        'DNAT backend address incorrect: ' + repr(received))
                    assert received.get('remote') == client_source, (
                        'DNAT backend sees unexpected client: ' + repr(received))
                    assert response == {'reply': 'FWB-PACKET-REPLY', 'peer': destination}, (
                        'DNAT conntrack return packet incorrect: ' + repr(response))
                else:
                    assert connected == 'connected' and received.get('payload') == 'FWB-PACKET-PROBE', (
                        'allowed TCP/%s not delivered: %s, %s' % (port, connected, received))
            else:
                assert connected == 'connection-failed' and received.get('timeout') is True, (
                    'denied TCP/%s was delivered: %s, %s' % (port, connected, received))
        finally:
            if server.poll() is None:
                server.kill()
                server.wait()


def interface_mac(pid=None):
    """Get the eth0 L2 address *inside* the selected network namespace.

    Rtnetlink (ip -j link) respects nsenter -n; reading /sys/class/net
    can instead return the original mount namespace's MAC for both peers.
    """
    args = ('ip', '-j', 'link', 'show', 'dev', 'eth0')
    raw = peer(pid, *args, capture=True) if pid is not None else call(*args, capture=True)
    try:
        links = json.loads(raw)
    except (TypeError, ValueError) as exc:
        raise RuntimeError('invalid rtnetlink interface response for eth0') from exc
    if not isinstance(links, list) or len(links) != 1 or links[0].get('ifname') != 'eth0':
        raise RuntimeError('expected exactly one eth0 interface in network namespace')
    mac = links[0].get('address', '').lower()
    if not re.fullmatch(r'(?:[0-9a-f]{2}:){5}[0-9a-f]{2}', mac) or (int(mac[:2], 16) & 1):
        raise RuntimeError('invalid unicast Ethernet MAC for eth0: %r' % mac)
    return mac


def setup_network(wan, lan, static_ipv6_neighbors=True):
    # Outer namespace is the disposable firewall. Anonymous peer namespaces
    # live only for this process; no /run/netns host mountpoints are used.
    call('ip', 'link', 'set', 'lo', 'up')
    call('ip', 'link', 'add', 'eth0', 'type', 'veth', 'peer', 'name', 'fwbwan')
    call('ip', 'link', 'set', 'fwbwan', 'netns', str(wan))
    call('ip', 'link', 'add', 'eth1', 'type', 'veth', 'peer', 'name', 'fwblan')
    call('ip', 'link', 'set', 'fwblan', 'netns', str(lan))
    peer(wan, 'ip', 'link', 'set', 'fwbwan', 'name', 'eth0')
    peer(lan, 'ip', 'link', 'set', 'fwblan', 'name', 'eth1')
    for iface in ('eth0', 'eth1'):
        call('ip', 'link', 'set', iface, 'up')
    for pid, iface in ((wan, 'eth0'), (lan, 'eth1')):
        peer(pid, 'ip', 'link', 'set', 'lo', 'up')
        peer(pid, 'ip', 'link', 'set', iface, 'up')

    call('ip', '-4', 'addr', 'add', '192.0.2.1/24', 'dev', 'eth0')
    call('ip', '-4', 'addr', 'add', '192.0.2.100/32', 'dev', 'eth0')
    call('ip', '-4', 'addr', 'add', '192.168.1.1/24', 'dev', 'eth1')
    peer(wan, 'ip', '-4', 'addr', 'add', '192.0.2.2/24', 'dev', 'eth0')
    peer(lan, 'ip', '-4', 'addr', 'add', '192.168.1.2/24', 'dev', 'eth1')
    peer(wan, 'ip', '-4', 'route', 'add', 'default', 'via', '192.0.2.1')
    peer(lan, 'ip', '-4', 'route', 'add', 'default', 'via', '192.168.1.1')
    Path('/proc/sys/net/ipv4/ip_forward').write_text('1\n')

    call('ip', '-6', 'addr', 'add', '2001:db8:1::1/64', 'dev', 'eth0', 'nodad')
    peer(wan, 'ip', '-6', 'addr', 'add', '2001:db8:1::2/64', 'dev', 'eth0', 'nodad')
    if not static_ipv6_neighbors:
        # NDP case intentionally has no preloaded L2 cache. Firewall-generated
        # NS/NA permissions must allow the kernel to discover both peers.
        return
    # A network-namespace-only nsenter does NOT guarantee /sys/class/net
    # shows the peer's interfaces: sysfs is tied to the mount namespace.
    # Query the active network namespace via rtnetlink instead.
    root_mac = interface_mac()
    wan_mac = interface_mac(wan)
    if root_mac == wan_mac:
        raise RuntimeError('IPv6 veth endpoints have identical MACs; refusing invalid static neighbors')
    print('IPv6 peer link: firewall eth0=%s; peer eth0=%s' % (root_mac, wan_mac),
          flush=True)
    # Keep neighbor discovery out of this echo-policy test: configure each
    # *actual* veth endpoint's MAC, without changing the FWB ruleset.
    call('ip', '-6', 'neigh', 'replace', '2001:db8:1::2', 'lladdr', wan_mac,
         'dev', 'eth0', 'nud', 'permanent')
    peer(wan, 'ip', '-6', 'neigh', 'replace', '2001:db8:1::1', 'lladdr', root_mac,
         'dev', 'eth0', 'nud', 'permanent')



def diagnose_ipv6_echo(wan):
    """Trace actual ICMPv6 verdicts; never add a rule to an FWB-owned table.

    A separate trace-only table sets nftrace, without changing ACCEPT/DROP.
    The policy under test remains precisely the fwb_nft-generated policy.
    """
    spec = """add table ip6 fwb_ci_packet_trace
add chain ip6 fwb_ci_packet_trace pre { type filter hook prerouting priority -301; policy accept; }
add rule ip6 fwb_ci_packet_trace pre ip6 nexthdr icmpv6 meta nftrace set 1
add chain ip6 fwb_ci_packet_trace out { type filter hook output priority -301; policy accept; }
add rule ip6 fwb_ci_packet_trace out ip6 nexthdr icmpv6 meta nftrace set 1
"""
    with tempfile.TemporaryDirectory(prefix='fwb-nft-ipv6-trace-') as directory:
        txn = Path(directory) / 'trace.nft'
        trace_log = Path(directory) / 'events.log'
        txn.write_text(spec)
        call('nft', '-f', str(txn))
        failure = None
        try:
            with trace_log.open('w+') as trace_stream:
                monitor = subprocess.Popen(('nft', 'monitor', 'trace'),
                                           stdout=trace_stream, stderr=subprocess.STDOUT,
                                           text=True)
                try:
                    time.sleep(0.15)
                    if monitor.poll() is not None:
                        raise RuntimeError('nft monitor trace exited before the ping')
                    peer(wan, 'ping', '-6', '-n', '-c', '1', '-W', '2', '2001:db8:1::1')
                except RuntimeError as exc:
                    failure = exc
                finally:
                    if monitor.poll() is None:
                        monitor.terminate()
                    try:
                        monitor.communicate(timeout=3)
                    except subprocess.TimeoutExpired:
                        monitor.kill()
                        monitor.communicate()
                    if failure is not None:
                        trace_stream.seek(0)
                        print('=== IPv6 nft packet trace (real FWB policy) ===',
                              file=sys.stderr, flush=True)
                        print(trace_stream.read() or '[no traced ICMPv6 packets]',
                              file=sys.stderr, flush=True)
            if failure is not None:
                checks = (
                    ('Firewall IPv6 routes', ('ip', '-6', 'route', 'show')),
                    ('Peer IPv6 routes', ('nsenter', '-t', str(wan), '-n', '--',
                                          'ip', '-6', 'route', 'show')),
                    ('Firewall IPv6 addresses', ('ip', '-6', 'addr', 'show', 'dev', 'eth0')),
                    ('Peer IPv6 addresses', ('nsenter', '-t', str(wan), '-n', '--',
                                             'ip', '-6', 'addr', 'show', 'dev', 'eth0')),
                    ('Firewall IPv6 neighbors', ('ip', '-6', 'neigh', 'show', 'dev', 'eth0')),
                    ('Peer IPv6 neighbors', ('nsenter', '-t', str(wan), '-n', '--',
                                             'ip', '-6', 'neigh', 'show', 'dev', 'eth0')),
                    ('FWB IPv6 filter', ('nft', '-a', 'list', 'table', 'ip6', 'fwb_filter')),
                )
                for title, args in checks:
                    result = subprocess.run(args, text=True, capture_output=True, check=False)
                    print('=== %s (exit=%s) ===\n%s%s' %
                          (title, result.returncode, result.stdout, result.stderr),
                          file=sys.stderr, flush=True)
        finally:
            removed = subprocess.run(('nft', 'delete', 'table', 'ip6',
                                      'fwb_ci_packet_trace'), text=True,
                                     capture_output=True, check=False)
            if removed.returncode:
                raise RuntimeError('could not remove isolated nft trace table: ' +
                                   removed.stderr)
        if failure is not None:
            raise failure


def check_dynamic_ipv6_neighbor(pid, destination, expected_mac):
    """Verify genuine nonpermanent NDP cache entries, not a synthetic route."""
    cmd = ('ip', '-6', '-j', 'neigh', 'show', 'to', destination, 'dev', 'eth0')
    raw = peer(pid, *cmd, capture=True) if pid else call(*cmd, capture=True)
    records = json.loads(raw)
    if len(records) != 1 or records[0].get('dst') != destination:
        raise RuntimeError('IPv6 neighbor missing after echo: ' + destination)
    record = records[0]
    if record.get('lladdr', '').lower() != expected_mac:
        raise RuntimeError('NDP learned wrong MAC: ' + repr(record))
    states = record.get('state', [])
    if isinstance(states, str):
        states = [states]
    if 'PERMANENT' in states or any(state in ('FAILED', 'INCOMPLETE') for state in states):
        raise RuntimeError('NDP entry not dynamically resolved: ' + repr(record))



def main():
    if len(sys.argv) >= 2 and sys.argv[1] == '--worker':
        worker()
        return
    if (len(sys.argv) not in (3, 4) or sys.argv[1] not in CASES
            or (len(sys.argv) == 4 and sys.argv[3] != '--expect-block')):
        raise SystemExit('Usage: check-nft-packets.py nft-ci-CASE.fw START.nft [--expect-block]')
    if os.geteuid() != 0 or os.stat('/proc/self/ns/net').st_ino == os.stat('/proc/1/ns/net').st_ino:
        raise SystemExit('REFUSING packet tests outside isolated root network namespace')
    fw_name, start_path = sys.argv[1:3]
    expect_block = len(sys.argv) == 4
    if expect_block and fw_name not in (
            'nft-ci-packet-tcp-input.fw',
            'nft-ci-packet-udp-forward.fw',
            'nft-ci-ipv6-icmp.fw'):
        raise RuntimeError('no independently verified emergency block probe for ' + fw_name)
    case, pattern = CASES[fw_name]
    rules = Path(start_path).read_text()
    if not re.search(pattern, rules, re.MULTILINE):
        raise RuntimeError('Generated FWB rules lack expected %s expression' % case)
    if case == 'dnat' and not re.search(
            r'^add rule ip fwb_filter FORWARD .*tcp dport 80 .*accept\s*$',
            rules, re.MULTILINE):
        raise RuntimeError('DNAT fixture has no forwarding TCP/80 allow rule')
    if case == 'dnat' and not re.search(
            r'^add rule ip fwb_nat PREROUTING .*ip daddr 192\.0\.2\.101 .*tcp dport 80 .*dnat to 192\.168\.1\.100\s*$',
            rules, re.MULTILINE):
        raise RuntimeError('DNAT fixture lacks public destination and port match')
    if case == 'snat' and not re.search(
            r'^add rule ip fwb_filter FORWARD .*udp dport 53 .*accept\s*$',
            rules, re.MULTILINE):
        raise RuntimeError('SNAT fixture has no forwarding UDP allow rule')
    if case in ('icmpv6', 'icmpv6-ndp') and 'add table ip6 fwb_filter' not in rules:
        raise RuntimeError('IPv6 fixture has no IPv6 filter table')

    if case == 'icmpv6-ndp':
        for icmp_type in (135, 136):
            if not re.search(r'^add rule ip6 fwb_filter (INPUT|OUTPUT) .*icmpv6 type %s .*accept\s*$' % icmp_type,
                             rules, re.MULTILINE):
                raise RuntimeError('FWB IPv6 policy lacks explicit NDP type %s allow' % icmp_type)

    keepers = []
    try:
        for _ in range(2):
            p = subprocess.Popen(('unshare', '--net', '--', 'sleep', '90'),
                                 stderr=subprocess.PIPE, text=True)
            keepers.append(p)
            for attempt in range(100):
                if p.poll() is not None:
                    raise RuntimeError('peer unshare failed: ' + p.stderr.read())
                try:
                    if os.stat('/proc/%s/ns/net' % p.pid).st_ino != os.stat('/proc/self/ns/net').st_ino:
                        break
                except FileNotFoundError:
                    pass
                time.sleep(0.02)
            else:
                raise RuntimeError('peer network namespace did not start')
        wan, lan = [p.pid for p in keepers]
        setup_network(wan, lan, static_ipv6_neighbors=(expect_block or case != 'icmpv6-ndp'))
        if expect_block:
            # The same FWB fixture must have allowed this exact packet before
            # emergency block (checked in the normal runtime test above).
            # Exercise the kernel again AFTER the FWB-generated BLOCK transaction.
            if case == 'tcp-input':
                probe_tcp(wan, '192.0.2.1', 80, False)
            elif case == 'udp-forward':
                probe_udp(wan, lan, '192.0.2.2', '192.0.2.2', 53, False)
            elif case == 'icmpv6':
                result = subprocess.run(
                    ('nsenter', '-t', str(wan), '-n', '--',
                     'ping', '-6', '-n', '-c', '1', '-W', '2', '2001:db8:1::1'),
                    text=True, capture_output=True, check=False)
                output = result.stdout + result.stderr
                if (result.returncode != 1 or not re.search(
                        r'1 packets transmitted, 0 received', output)):
                    raise RuntimeError('IPv6 echo not demonstrably blocked: ' + output)
            print('PASS: emergency block denies previously allowed %s traffic' % case,
                  flush=True)
            return
        if case == 'tcp-input':
            probe_tcp(wan, '192.0.2.1', 80, True)
            probe_tcp(wan, '192.0.2.1', 81, False)
        elif case == 'udp-forward':
            probe_udp(wan, lan, '192.0.2.2', '192.0.2.2', 53, True)
            probe_udp(wan, lan, '192.0.2.2', '192.0.2.2', 54, False)
        elif case == 'snat':
            probe_udp(wan, lan, '192.0.2.2', '192.0.2.2', 53, True,
                      source='192.0.2.100', reply=True)
            print('PASS: SNAT forward translation and conntrack return traffic',
                  flush=True)
        elif case == 'dnat':
            # The WAN must resolve the public DNAT endpoint; the LAN backend
            # listens ONLY on the translated private address.
            call('ip', '-4', 'addr', 'add', '192.0.2.101/32', 'dev', 'eth0')
            peer(lan, 'ip', '-4', 'addr', 'add', '192.168.1.100/32', 'dev', 'eth1')
            probe_tcp(wan, '192.0.2.101', 80, True,
                      namespace_server=lan, bind='192.168.1.100', reply=True,
                      client_source='192.0.2.2')
            probe_tcp(wan, '192.0.2.101', 81, False,
                      namespace_server=lan, bind='192.168.1.100')
            print('PASS: DNAT public TCP/80 to private server and conntrack return traffic; TCP/81 denied',
                  flush=True)
        elif case == 'icmpv6':
            diagnose_ipv6_echo(wan)
        elif case == 'icmpv6-ndp':
            peer(wan, 'ping', '-6', '-n', '-c', '1', '-W', '3', '2001:db8:1::1')
            check_dynamic_ipv6_neighbor(None, '2001:db8:1::2', interface_mac(wan))
            check_dynamic_ipv6_neighbor(wan, '2001:db8:1::1', interface_mac())
            print('PASS: IPv6 echo with dynamically discovered NDP neighbors', flush=True)
        print('PASS: real %s packets obey FWB-generated nftables policy' % case, flush=True)
    finally:
        for p in keepers:
            if p.poll() is None:
                p.terminate()
            try:
                p.communicate(timeout=2)
            except subprocess.TimeoutExpired:
                p.kill()
                p.communicate()


if __name__ == '__main__':
    try:
        main()
    except (OSError, RuntimeError, AssertionError, ValueError) as exc:
        print('FAIL: nftables packet test: %s' % exc, file=sys.stderr)
        sys.exit(1)
