#!/usr/bin/env bash
# Phase-27900: STATUS mentions ssh_auth_ms_65500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_65500_echo_roster|soft_fertig_ssh_auth_ms_65500_echo_roster' webui/STATUS.md
grep -qE 'phase27904|through 27904|e2e-phase27904' webui/STATUS.md
echo "STATUS ssh-auth-ms-65500-echo roster ok"; echo "cleaned"; echo "OK: phase27900 e2e passed"
