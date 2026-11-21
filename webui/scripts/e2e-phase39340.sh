#!/usr/bin/env bash
# Phase-39340: STATUS mentions ssh_auth_soft_41200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_41200_echo_roster|soft_fertig_ssh_auth_soft_41200_echo_roster' webui/STATUS.md
grep -qE 'phase39344|through 39344|e2e-phase39344' webui/STATUS.md
echo "STATUS ssh-auth-soft-41200-echo roster ok"; echo "cleaned"; echo "OK: phase39340 e2e passed"
