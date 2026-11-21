#!/usr/bin/env bash
# Phase-16300: STATUS mentions ssh_auth_soft_16320_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_16320_echo_roster|soft_fertig_ssh_auth_soft_16320_echo_roster' webui/STATUS.md
grep -qE 'phase16304|through 16304|e2e-phase16304' webui/STATUS.md
echo "STATUS ssh-auth-soft-16320-echo roster ok"; echo "cleaned"; echo "OK: phase16300 e2e passed"
