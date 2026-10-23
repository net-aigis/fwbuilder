#!/usr/bin/env python3
"""Real FWB-generated DNAT LB packet regression in isolated network namespaces.

The controller creates a fresh network namespace per compiled FWB fixture.
It NEVER executes nft against the invoking network namespace. Each case uses
actual conntrack DNAT with two backend listeners and independent TCP streams.
"""
import importlib.util
import json
import os
from pathlib import Path
import re
import socket
import subprocess
import sys
import tempfile
import time

PASSES = 96
PUBLIC = '192.0.2.101'
PORT = 80
BACKENDS = {
    'contiguous': ('192.168.1.100', '192.168.1.101'),
    'sparse': ('192.168.1.100', '192.168.1.103'),
}


def packet_helpers():
    path = Path(__file__).with_name('check-nft-packets.py')
    spec = importlib.util.spec_from_file_location('fwb_packet_helpers', path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def read_fwb_nft_transaction(path, mode):
    text = Path(path).read_text()
    opening = "<<'FWB_NFT_RULESET'"
    if text.count(opening) != 1:
        raise RuntimeError('Expected exactly one native nft start transaction: ' + str(path))
    lines = text.splitlines()
    start = next(i for i, line in enumerate(lines) if opening in line) + 1
    try:
        stop = lines.index('FWB_NFT_RULESET', start)
    except ValueError as e:
        raise RuntimeError('Native transaction terminator missing') from e
    rules = '\n'.join(lines[start:stop]) + '\n'
    # Native FWB replaces only managed tables. The script-body template
    # indents its first line; accept shell indentation but require the
    # unmodified begin -> heredoc -> commit sequence.
    begin = re.search(r'^[ \t]*fwb_nft_begin_transaction[ \t]+\|\|[ \t]+exit[ \t]+1[ \t]*$',
                      text, re.MULTILINE)
    commit = re.search(r'^[ \t]*fwb_nft_commit_transaction[ \t]+\|\|[ \t]+exit[ \t]+1[ \t]*$',
                       text, re.MULTILINE)
    if not begin or not commit or not (begin.start() < text.find(opening) < commit.start()):
        raise RuntimeError('Missing genuine FWB atomic begin/heredoc/commit sequence')
    if re.search(r'^flush ruleset\s*$', rules, re.MULTILINE):
        raise RuntimeError('Unsafe global flush in native FWB atomic transaction')
    if not re.search(r'^add table ip fwb_nat\s*$', rules, re.MULTILINE):
        raise RuntimeError('Missing genuine FWB IPv4 NAT table')
    if not re.search(r'^add rule ip fwb_filter FORWARD .*tcp dport 80 .*accept\s*$',
                     rules, re.MULTILINE):
        raise RuntimeError('Missing genuine FWB TCP/80 forwarding allow')
    if mode == 'sparse':
        destination = r'numgen random mod 2 map \{ 0 : 192\.168\.1\.100, 1 : 192\.168\.1\.103 \}'
    else:
        destination = r'192\.168\.1\.100-192\.168\.1\.101'
    if not re.search(
            r'^add rule ip fwb_nat PREROUTING .*ip daddr 192\.0\.2\.101 .*tcp dport 80 .*dnat to '
            + destination + r'\s*$', rules, re.MULTILINE):
        raise RuntimeError('FWB DNAT expression does not match expected ' + mode + ' pool')
    return rules


def server_worker(ip, output):
    out = Path(output)
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as listener:
        listener.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        listener.bind((ip, PORT))
        listener.listen(32)
        listener.settimeout(0.5)
        out.with_suffix('.ready').touch()
        while True:
            try:
                conn, _ = listener.accept()
            except socket.timeout:
                continue
            with conn:
                conn.settimeout(2.0)
                for expected in (b'1', b'2'):
                    payload = conn.recv(1)
                    if payload != expected:
                        raise RuntimeError('Backend TCP stream unexpectedly changed')
                    conn.sendall(b'A' if ip.endswith('.100') else b'B')


def client_worker(public, output, attempts):
    counts = {'A': 0, 'B': 0}
    for i in range(attempts):
        with socket.create_connection((public, PORT), timeout=3.0) as connection:
            connection.settimeout(3.0)
            replies = []
            for request in (b'1', b'2'):
                connection.sendall(request)
                replies.append(connection.recv(1))
            if replies[0] not in (b'A', b'B') or replies[1] != replies[0]:
                raise RuntimeError('Connection changed backend while established: ' + repr(replies))
            counts[replies[0].decode('ascii')] += 1
    Path(output).write_text(json.dumps(counts))


def run_one_case(mode, script_path):
    if os.geteuid() != 0:
        raise RuntimeError('Packet test needs root inside disposable namespaces')
    if os.stat('/proc/self/ns/net').st_ino == os.stat('/proc/1/ns/net').st_ino:
        raise RuntimeError('REFUSING nft transaction in the host network namespace')
    helper = packet_helpers()
    rules = read_fwb_nft_transaction(script_path, mode)
    peers = []
    servers = []
    try:
        for _ in range(2):
            p = subprocess.Popen(('unshare', '--net', '--', 'sleep', '90'),
                                 stderr=subprocess.PIPE, text=True)
            peers.append(p)
            for _ in range(100):
                if p.poll() is not None:
                    raise RuntimeError('peer namespace exited: ' + p.stderr.read())
                try:
                    if os.stat('/proc/%d/ns/net' % p.pid).st_ino != os.stat('/proc/self/ns/net').st_ino:
                        break
                except FileNotFoundError:
                    pass
                time.sleep(0.02)
            else:
                raise RuntimeError('peer network namespace unavailable')
        wan, lan = [p.pid for p in peers]
        helper.setup_network(wan, lan, static_ipv6_neighbors=False)
        helper.call('ip', '-4', 'addr', 'add', PUBLIC + '/32', 'dev', 'eth0')
        with tempfile.TemporaryDirectory(prefix='fwb-pr6-lb-kernel-') as tmp:
            for number, ip in enumerate(BACKENDS[mode]):
                helper.peer(lan, 'ip', '-4', 'addr', 'add', ip + '/32', 'dev', 'eth1')
                status = Path(tmp) / ('server-%d.json' % number)
                server = subprocess.Popen(('nsenter', '-t', str(lan), '-n', '--',
                                           sys.executable, __file__, '--server', ip, str(status)),
                                          stderr=subprocess.PIPE, text=True)
                servers.append(server)
                helper.wait_ready(status, server)
            txn = Path(tmp) / 'generated-fwb.nft'
            txn.write_text(rules)
            helper.call('nft', '--check', '-f', str(txn))
            helper.call('nft', '-f', str(txn))
            output = Path(tmp) / 'clients.json'
            helper.peer(wan, sys.executable, __file__, '--client', PUBLIC, str(output), str(PASSES))
            counts = json.loads(output.read_text())
            if set(counts) != {'A', 'B'} or min(counts.values()) < 1 or sum(counts.values()) != PASSES:
                raise RuntimeError('Both backends not demonstrably reached: ' + repr(counts))
            if any(server.poll() is not None for server in servers):
                raise RuntimeError('A backend listener stopped unexpectedly')
            print('PASS: real FWB %s DNAT: both backends, %d TCP streams, '
                  'stable conntrack per stream (%s)' % (mode, PASSES, counts), flush=True)
    finally:
        for server in servers:
            if server.poll() is None:
                server.terminate()
            try:
                _, error = server.communicate(timeout=3)
                if error and server.returncode not in (0, -15):
                    print('Backend diagnostic: ' + error, file=sys.stderr)
            except subprocess.TimeoutExpired:
                server.kill()
                server.communicate()
        for p in peers:
            if p.poll() is None:
                p.terminate()
            try:
                p.communicate(timeout=3)
            except subprocess.TimeoutExpired:
                p.kill()
                p.communicate()


def main():
    if len(sys.argv) == 4 and sys.argv[1] == '--server':
        server_worker(sys.argv[2], sys.argv[3]); return
    if len(sys.argv) == 5 and sys.argv[1] == '--client':
        client_worker(sys.argv[2], sys.argv[3], int(sys.argv[4])); return
    if len(sys.argv) == 4 and sys.argv[1] == '--case':
        run_one_case(sys.argv[2], sys.argv[3]); return
    if len(sys.argv) != 3:
        raise SystemExit('Usage: check-nft-nat-lb-kernel.py SPARSE.fw CONTIGUOUS.fw')
    if os.geteuid() != 0:
        raise SystemExit('REFUSING: NAT kernel regression requires root')
    # The outer invocation never changes its own network namespace.
    for mode, path in (('sparse', sys.argv[1]), ('contiguous', sys.argv[2])):
        absolute = str(Path(path).resolve(strict=True))
        read_fwb_nft_transaction(absolute, mode)
        subprocess.run(('unshare', '--net', '--mount-proc', '--', sys.executable,
                        __file__, '--case', mode, absolute), check=True)
    print('PASS: both FWB DNAT load-balancing modes passed real kernel packet testing')


if __name__ == '__main__':
    try:
        main()
    except (OSError, RuntimeError, AssertionError, ValueError, subprocess.CalledProcessError) as error:
        print('FAIL: NAT LB kernel packet regression: ' + str(error), file=sys.stderr)
        sys.exit(1)
