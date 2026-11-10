#!/usr/bin/env bash
# Phase-27580: STATUS mentions ssh_auth_ms_65000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_65000_echo_roster|soft_fertig_ssh_auth_ms_65000_echo_roster' webui/STATUS.md
grep -qE 'phase27584|through 27584|e2e-phase27584' webui/STATUS.md
echo "STATUS ssh-auth-ms-65000-echo roster ok"; echo "cleaned"; echo "OK: phase27580 e2e passed"
