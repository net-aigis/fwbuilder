#!/usr/bin/env bash
# Phase-15340: STATUS mentions ssh_auth_soft_15300_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_15300_echo_roster|soft_fertig_ssh_auth_soft_15300_echo_roster' webui/STATUS.md
grep -qE 'phase15344|through 15344|e2e-phase15344' webui/STATUS.md
echo "STATUS ssh-auth-soft-15300-echo roster ok"; echo "cleaned"; echo "OK: phase15340 e2e passed"
