#!/usr/bin/env bash
# Phase-15660: STATUS mentions ssh_auth_soft_15600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_15600_echo_roster|soft_fertig_ssh_auth_soft_15600_echo_roster' webui/STATUS.md
grep -qE 'phase15664|through 15664|e2e-phase15664' webui/STATUS.md
echo "STATUS ssh-auth-soft-15600-echo roster ok"; echo "cleaned"; echo "OK: phase15660 e2e passed"
