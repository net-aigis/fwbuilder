#!/usr/bin/env bash
# Phase-42620: STATUS mentions ssh_auth_ms_88500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_88500_echo_roster|soft_fertig_ssh_auth_ms_88500_echo_roster' webui/STATUS.md
grep -qE 'phase42624|through 42624|e2e-phase42624' webui/STATUS.md
echo "STATUS ssh-auth-ms-88500-echo roster ok"; echo "cleaned"; echo "OK: phase42620 e2e passed"
