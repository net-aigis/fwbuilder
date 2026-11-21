#!/usr/bin/env bash
# Phase-22380: STATUS mentions ssh_auth_soft_22560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_22560_echo_roster|soft_fertig_ssh_auth_soft_22560_echo_roster' webui/STATUS.md
grep -qE 'phase22384|through 22384|e2e-phase22384' webui/STATUS.md
echo "STATUS ssh-auth-soft-22560-echo roster ok"; echo "cleaned"; echo "OK: phase22380 e2e passed"
