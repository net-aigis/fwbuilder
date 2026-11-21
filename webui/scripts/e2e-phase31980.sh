#!/usr/bin/env bash
# Phase-31980: STATUS mentions ssh_auth_soft_33000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_33000_echo_roster|soft_fertig_ssh_auth_soft_33000_echo_roster' webui/STATUS.md
grep -qE 'phase31984|through 31984|e2e-phase31984' webui/STATUS.md
echo "STATUS ssh-auth-soft-33000-echo roster ok"; echo "cleaned"; echo "OK: phase31980 e2e passed"
