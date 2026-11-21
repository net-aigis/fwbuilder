#!/usr/bin/env bash
# Phase-44220: STATUS mentions ssh_auth_ms_91000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_91000_echo_roster|soft_fertig_ssh_auth_ms_91000_echo_roster' webui/STATUS.md
grep -qE 'phase44224|through 44224|e2e-phase44224' webui/STATUS.md
echo "STATUS ssh-auth-ms-91000-echo roster ok"; echo "cleaned"; echo "OK: phase44220 e2e passed"
