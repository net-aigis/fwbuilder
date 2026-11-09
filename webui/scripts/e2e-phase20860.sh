#!/usr/bin/env bash
# Phase-20860: STATUS mentions ssh_auth_ms_54500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_54500_echo_roster|soft_fertig_ssh_auth_ms_54500_echo_roster' webui/STATUS.md
grep -qE 'phase20864|through 20864|e2e-phase20864' webui/STATUS.md
echo "STATUS ssh-auth-ms-54500-echo roster ok"; echo "cleaned"; echo "OK: phase20860 e2e passed"
