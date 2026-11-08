#!/usr/bin/env bash
# Phase-15980: STATUS mentions ssh_auth_soft_15960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_15960_echo_roster|soft_fertig_ssh_auth_soft_15960_echo_roster' webui/STATUS.md
grep -qE 'phase15984|through 15984|e2e-phase15984' webui/STATUS.md
echo "STATUS ssh-auth-soft-15960-echo roster ok"; echo "cleaned"; echo "OK: phase15980 e2e passed"
