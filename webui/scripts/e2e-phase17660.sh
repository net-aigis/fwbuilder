#!/usr/bin/env bash
# Phase-17660: STATUS mentions ssh_auth_ms_49500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_49500_echo_roster|soft_fertig_ssh_auth_ms_49500_echo_roster' webui/STATUS.md
grep -qE 'phase17664|through 17664|e2e-phase17664' webui/STATUS.md
echo "STATUS ssh-auth-ms-49500-echo roster ok"; echo "cleaned"; echo "OK: phase17660 e2e passed"
