#!/usr/bin/env bash
# Phase-10140: STATUS mentions ssh_auth_support_gate_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_support_gate_roster|soft_fertig_ssh_auth_support_gate_roster' webui/STATUS.md
grep -qE 'phase10144|through 10144|e2e-phase10144' webui/STATUS.md
echo "STATUS ssh-auth-support-gate roster ok"; echo "cleaned"; echo "OK: phase10140 e2e passed"
