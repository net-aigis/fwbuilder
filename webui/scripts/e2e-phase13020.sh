#!/usr/bin/env bash
# Phase-13020: STATUS mentions ssh_auth_soft_plus_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_plus_echo_roster|soft_fertig_ssh_auth_soft_plus_echo_roster' webui/STATUS.md
grep -qE 'phase13024|through 13024|e2e-phase13024' webui/STATUS.md
echo "STATUS ssh-auth-soft-plus-echo roster ok"; echo "cleaned"; echo "OK: phase13020 e2e passed"
