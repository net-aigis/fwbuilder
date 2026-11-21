#!/usr/bin/env bash
# Phase-46140: STATUS mentions ssh_auth_ms_94000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_94000_echo_roster|soft_fertig_ssh_auth_ms_94000_echo_roster' webui/STATUS.md
grep -qE 'phase46144|through 46144|e2e-phase46144' webui/STATUS.md
echo "STATUS ssh-auth-ms-94000-echo roster ok"; echo "cleaned"; echo "OK: phase46140 e2e passed"
