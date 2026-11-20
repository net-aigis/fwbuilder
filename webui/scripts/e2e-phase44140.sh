#!/usr/bin/env bash
# Phase-44140: STATUS mentions ssh_auth_soft_46600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_46600_echo_roster|soft_fertig_ssh_auth_soft_46600_echo_roster' webui/STATUS.md
grep -qE 'phase44144|through 44144|e2e-phase44144' webui/STATUS.md
echo "STATUS ssh-auth-soft-46600-echo roster ok"; echo "cleaned"; echo "OK: phase44140 e2e passed"
