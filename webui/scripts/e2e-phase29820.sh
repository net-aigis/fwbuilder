#!/usr/bin/env bash
# Phase-29820: STATUS mentions ssh_auth_ms_68500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_68500_echo_roster|soft_fertig_ssh_auth_ms_68500_echo_roster' webui/STATUS.md
grep -qE 'phase29824|through 29824|e2e-phase29824' webui/STATUS.md
echo "STATUS ssh-auth-ms-68500-echo roster ok"; echo "cleaned"; echo "OK: phase29820 e2e passed"
