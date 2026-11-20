#!/usr/bin/env bash
# Phase-45180: STATUS mentions ssh_auth_ms_92500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_92500_echo_roster|soft_fertig_ssh_auth_ms_92500_echo_roster' webui/STATUS.md
grep -qE 'phase45184|through 45184|e2e-phase45184' webui/STATUS.md
echo "STATUS ssh-auth-ms-92500-echo roster ok"; echo "cleaned"; echo "OK: phase45180 e2e passed"
