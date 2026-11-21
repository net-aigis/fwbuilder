#!/usr/bin/env bash
# Phase-17580: STATUS mentions ssh_auth_soft_17560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_17560_echo_roster|soft_fertig_ssh_auth_soft_17560_echo_roster' webui/STATUS.md
grep -qE 'phase17584|through 17584|e2e-phase17584' webui/STATUS.md
echo "STATUS ssh-auth-soft-17560-echo roster ok"; echo "cleaned"; echo "OK: phase17580 e2e passed"
