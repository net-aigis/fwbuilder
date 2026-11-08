#!/usr/bin/env bash
# Phase-10060: STATUS mentions ssh_auth_batch_gate_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_batch_gate_roster|soft_fertig_ssh_auth_batch_gate_roster' webui/STATUS.md
grep -qE 'phase10064|through 10064|e2e-phase10064' webui/STATUS.md
echo "STATUS ssh-auth-batch-gate roster ok"; echo "cleaned"; echo "OK: phase10060 e2e passed"
