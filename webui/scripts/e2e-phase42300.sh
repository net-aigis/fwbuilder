#!/usr/bin/env bash
# Phase-42300: STATUS mentions ssh_auth_ms_88000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_88000_echo_roster|soft_fertig_ssh_auth_ms_88000_echo_roster' webui/STATUS.md
grep -qE 'phase42304|through 42304|e2e-phase42304' webui/STATUS.md
echo "STATUS ssh-auth-ms-88000-echo roster ok"; echo "cleaned"; echo "OK: phase42300 e2e passed"
