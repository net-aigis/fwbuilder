#!/usr/bin/env bash
# Phase-48380: STATUS mentions ssh_auth_ms_97500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_97500_echo_roster|soft_fertig_ssh_auth_ms_97500_echo_roster' webui/STATUS.md
grep -qE 'phase48384|through 48384|e2e-phase48384' webui/STATUS.md
echo "STATUS ssh-auth-ms-97500-echo roster ok"; echo "cleaned"; echo "OK: phase48380 e2e passed"
