#!/usr/bin/env bash
# Phase-23660: STATUS mentions ssh_auth_soft_23640_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_23640_echo_roster|soft_fertig_ssh_auth_soft_23640_echo_roster' webui/STATUS.md
grep -qE 'phase23664|through 23664|e2e-phase23664' webui/STATUS.md
echo "STATUS ssh-auth-soft-23640-echo roster ok"; echo "cleaned"; echo "OK: phase23660 e2e passed"
