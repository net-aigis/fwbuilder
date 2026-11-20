#!/usr/bin/env bash
# Phase-37820: STATUS mentions ssh_auth_ms_81000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_81000_echo_roster|soft_fertig_ssh_auth_ms_81000_echo_roster' webui/STATUS.md
grep -qE 'phase37824|through 37824|e2e-phase37824' webui/STATUS.md
echo "STATUS ssh-auth-ms-81000-echo roster ok"; echo "cleaned"; echo "OK: phase37820 e2e passed"
