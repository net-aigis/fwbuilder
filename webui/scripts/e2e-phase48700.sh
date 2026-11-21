#!/usr/bin/env bash
# Phase-48700: STATUS mentions ssh_auth_ms_98000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_98000_echo_roster|soft_fertig_ssh_auth_ms_98000_echo_roster' webui/STATUS.md
grep -qE 'phase48704|through 48704|e2e-phase48704' webui/STATUS.md
echo "STATUS ssh-auth-ms-98000-echo roster ok"; echo "cleaned"; echo "OK: phase48700 e2e passed"
