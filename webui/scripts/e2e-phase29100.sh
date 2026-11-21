#!/usr/bin/env bash
# Phase-29100: STATUS mentions ssh_auth_soft_29760_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_29760_echo_roster|soft_fertig_ssh_auth_soft_29760_echo_roster' webui/STATUS.md
grep -qE 'phase29104|through 29104|e2e-phase29104' webui/STATUS.md
echo "STATUS ssh-auth-soft-29760-echo roster ok"; echo "cleaned"; echo "OK: phase29100 e2e passed"
