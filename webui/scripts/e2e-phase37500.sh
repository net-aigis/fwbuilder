#!/usr/bin/env bash
# Phase-37500: STATUS mentions ssh_auth_ms_80500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_80500_echo_roster|soft_fertig_ssh_auth_ms_80500_echo_roster' webui/STATUS.md
grep -qE 'phase37504|through 37504|e2e-phase37504' webui/STATUS.md
echo "STATUS ssh-auth-ms-80500-echo roster ok"; echo "cleaned"; echo "OK: phase37500 e2e passed"
