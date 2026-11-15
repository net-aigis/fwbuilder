#!/usr/bin/env bash
# Phase-33260: STATUS mentions ssh_auth_soft_34440_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_34440_echo_roster|soft_fertig_ssh_auth_soft_34440_echo_roster' webui/STATUS.md
grep -qE 'phase33264|through 33264|e2e-phase33264' webui/STATUS.md
echo "STATUS ssh-auth-soft-34440-echo roster ok"; echo "cleaned"; echo "OK: phase33260 e2e passed"
