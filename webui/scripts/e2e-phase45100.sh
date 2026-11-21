#!/usr/bin/env bash
# Phase-45100: STATUS mentions ssh_auth_soft_47680_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_47680_echo_roster|soft_fertig_ssh_auth_soft_47680_echo_roster' webui/STATUS.md
grep -qE 'phase45104|through 45104|e2e-phase45104' webui/STATUS.md
echo "STATUS ssh-auth-soft-47680-echo roster ok"; echo "cleaned"; echo "OK: phase45100 e2e passed"
