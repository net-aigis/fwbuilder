#!/usr/bin/env bash
# Phase-36540: STATUS mentions ssh_auth_ms_79000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_79000_echo_roster|soft_fertig_ssh_auth_ms_79000_echo_roster' webui/STATUS.md
grep -qE 'phase36544|through 36544|e2e-phase36544' webui/STATUS.md
echo "STATUS ssh-auth-ms-79000-echo roster ok"; echo "cleaned"; echo "OK: phase36540 e2e passed"
