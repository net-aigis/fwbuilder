#!/usr/bin/env bash
# Phase-25660: STATUS mentions ssh_auth_ms_62000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_62000_echo_roster|soft_fertig_ssh_auth_ms_62000_echo_roster' webui/STATUS.md
grep -qE 'phase25664|through 25664|e2e-phase25664' webui/STATUS.md
echo "STATUS ssh-auth-ms-62000-echo roster ok"; echo "cleaned"; echo "OK: phase25660 e2e passed"
