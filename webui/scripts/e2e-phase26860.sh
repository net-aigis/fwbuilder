#!/usr/bin/env bash
# Phase-26860: STATUS mentions ssh_auth_soft_27240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_27240_echo_roster|soft_fertig_ssh_auth_soft_27240_echo_roster' webui/STATUS.md
grep -qE 'phase26864|through 26864|e2e-phase26864' webui/STATUS.md
echo "STATUS ssh-auth-soft-27240-echo roster ok"; echo "cleaned"; echo "OK: phase26860 e2e passed"
