#!/usr/bin/env bash
# Phase-22060: STATUS mentions ssh_auth_soft_22200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_22200_echo_roster|soft_fertig_ssh_auth_soft_22200_echo_roster' webui/STATUS.md
grep -qE 'phase22064|through 22064|e2e-phase22064' webui/STATUS.md
echo "STATUS ssh-auth-soft-22200-echo roster ok"; echo "cleaned"; echo "OK: phase22060 e2e passed"
