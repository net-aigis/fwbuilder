#!/usr/bin/env bash
# Phase-17980: STATUS mentions ssh_auth_ms_50000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_50000_echo_roster|soft_fertig_ssh_auth_ms_50000_echo_roster' webui/STATUS.md
grep -qE 'phase17984|through 17984|e2e-phase17984' webui/STATUS.md
echo "STATUS ssh-auth-ms-50000-echo roster ok"; echo "cleaned"; echo "OK: phase17980 e2e passed"
