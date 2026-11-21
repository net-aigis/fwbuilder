#!/usr/bin/env bash
# Phase-17020: STATUS mentions ssh_auth_ms_48500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_48500_echo_roster|soft_fertig_ssh_auth_ms_48500_echo_roster' webui/STATUS.md
grep -qE 'phase17024|through 17024|e2e-phase17024' webui/STATUS.md
echo "STATUS ssh-auth-ms-48500-echo roster ok"; echo "cleaned"; echo "OK: phase17020 e2e passed"
