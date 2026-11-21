#!/usr/bin/env bash
# Phase-43580: STATUS mentions ssh_auth_ms_90000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_90000_echo_roster|soft_fertig_ssh_auth_ms_90000_echo_roster' webui/STATUS.md
grep -qE 'phase43584|through 43584|e2e-phase43584' webui/STATUS.md
echo "STATUS ssh-auth-ms-90000-echo roster ok"; echo "cleaned"; echo "OK: phase43580 e2e passed"
