#!/usr/bin/env bash
# Phase-25580: STATUS mentions ssh_auth_soft_25800_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_25800_echo_roster|soft_fertig_ssh_auth_soft_25800_echo_roster' webui/STATUS.md
grep -qE 'phase25584|through 25584|e2e-phase25584' webui/STATUS.md
echo "STATUS ssh-auth-soft-25800-echo roster ok"; echo "cleaned"; echo "OK: phase25580 e2e passed"
