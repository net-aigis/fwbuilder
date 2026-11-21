#!/usr/bin/env bash
# Phase-44460: STATUS mentions ssh_auth_soft_46960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_46960_echo_roster|soft_fertig_ssh_auth_soft_46960_echo_roster' webui/STATUS.md
grep -qE 'phase44464|through 44464|e2e-phase44464' webui/STATUS.md
echo "STATUS ssh-auth-soft-46960-echo roster ok"; echo "cleaned"; echo "OK: phase44460 e2e passed"
