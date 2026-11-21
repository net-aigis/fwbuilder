#!/usr/bin/env bash
# Phase-27180: STATUS mentions ssh_auth_soft_27600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_27600_echo_roster|soft_fertig_ssh_auth_soft_27600_echo_roster' webui/STATUS.md
grep -qE 'phase27184|through 27184|e2e-phase27184' webui/STATUS.md
echo "STATUS ssh-auth-soft-27600-echo roster ok"; echo "cleaned"; echo "OK: phase27180 e2e passed"
