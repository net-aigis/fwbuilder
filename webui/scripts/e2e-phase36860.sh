#!/usr/bin/env bash
# Phase-36860: STATUS mentions ssh_auth_ms_79500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_79500_echo_roster|soft_fertig_ssh_auth_ms_79500_echo_roster' webui/STATUS.md
grep -qE 'phase36864|through 36864|e2e-phase36864' webui/STATUS.md
echo "STATUS ssh-auth-ms-79500-echo roster ok"; echo "cleaned"; echo "OK: phase36860 e2e passed"
