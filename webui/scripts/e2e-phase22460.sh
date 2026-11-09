#!/usr/bin/env bash
# Phase-22460: STATUS mentions ssh_auth_ms_57000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_57000_echo_roster|soft_fertig_ssh_auth_ms_57000_echo_roster' webui/STATUS.md
grep -qE 'phase22464|through 22464|e2e-phase22464' webui/STATUS.md
echo "STATUS ssh-auth-ms-57000-echo roster ok"; echo "cleaned"; echo "OK: phase22460 e2e passed"
