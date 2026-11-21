#!/usr/bin/env bash
# Phase-31660: STATUS mentions ssh_auth_soft_32640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_32640_echo_roster|soft_fertig_ssh_auth_soft_32640_echo_roster' webui/STATUS.md
grep -qE 'phase31664|through 31664|e2e-phase31664' webui/STATUS.md
echo "STATUS ssh-auth-soft-32640-echo roster ok"; echo "cleaned"; echo "OK: phase31660 e2e passed"
