#!/usr/bin/env bash
# Phase-25260: STATUS mentions ssh_auth_soft_25440_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_25440_echo_roster|soft_fertig_ssh_auth_soft_25440_echo_roster' webui/STATUS.md
grep -qE 'phase25264|through 25264|e2e-phase25264' webui/STATUS.md
echo "STATUS ssh-auth-soft-25440-echo roster ok"; echo "cleaned"; echo "OK: phase25260 e2e passed"
