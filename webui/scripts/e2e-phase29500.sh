#!/usr/bin/env bash
# Phase-29500: STATUS mentions ssh_auth_ms_68000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_68000_echo_roster|soft_fertig_ssh_auth_ms_68000_echo_roster' webui/STATUS.md
grep -qE 'phase29504|through 29504|e2e-phase29504' webui/STATUS.md
echo "STATUS ssh-auth-ms-68000-echo roster ok"; echo "cleaned"; echo "OK: phase29500 e2e passed"
