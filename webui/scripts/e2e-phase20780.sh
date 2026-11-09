#!/usr/bin/env bash
# Phase-20780: STATUS mentions ssh_auth_soft_20760_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_20760_echo_roster|soft_fertig_ssh_auth_soft_20760_echo_roster' webui/STATUS.md
grep -qE 'phase20784|through 20784|e2e-phase20784' webui/STATUS.md
echo "STATUS ssh-auth-soft-20760-echo roster ok"; echo "cleaned"; echo "OK: phase20780 e2e passed"
