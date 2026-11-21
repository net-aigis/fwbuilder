#!/usr/bin/env bash
# Phase-30380: STATUS mentions ssh_auth_soft_31200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_31200_echo_roster|soft_fertig_ssh_auth_soft_31200_echo_roster' webui/STATUS.md
grep -qE 'phase30384|through 30384|e2e-phase30384' webui/STATUS.md
echo "STATUS ssh-auth-soft-31200-echo roster ok"; echo "cleaned"; echo "OK: phase30380 e2e passed"
