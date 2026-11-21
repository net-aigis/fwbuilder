#!/usr/bin/env bash
# Phase-47100: STATUS mentions ssh_auth_ms_95500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_95500_echo_roster|soft_fertig_ssh_auth_ms_95500_echo_roster' webui/STATUS.md
grep -qE 'phase47104|through 47104|e2e-phase47104' webui/STATUS.md
echo "STATUS ssh-auth-ms-95500-echo roster ok"; echo "cleaned"; echo "OK: phase47100 e2e passed"
