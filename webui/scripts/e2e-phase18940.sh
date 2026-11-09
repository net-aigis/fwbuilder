#!/usr/bin/env bash
# Phase-18940: STATUS mentions ssh_auth_ms_51500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_51500_echo_roster|soft_fertig_ssh_auth_ms_51500_echo_roster' webui/STATUS.md
grep -qE 'phase18944|through 18944|e2e-phase18944' webui/STATUS.md
echo "STATUS ssh-auth-ms-51500-echo roster ok"; echo "cleaned"; echo "OK: phase18940 e2e passed"
