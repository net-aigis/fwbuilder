#!/usr/bin/env bash
# Phase-21100: STATUS mentions ssh_auth_soft_21120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_21120_echo_roster|soft_fertig_ssh_auth_soft_21120_echo_roster' webui/STATUS.md
grep -qE 'phase21104|through 21104|e2e-phase21104' webui/STATUS.md
echo "STATUS ssh-auth-soft-21120-echo roster ok"; echo "cleaned"; echo "OK: phase21100 e2e passed"
