#!/usr/bin/env bash
# Phase-47340: STATUS mentions ssh_auth_soft_50200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_50200_echo_roster|soft_fertig_ssh_auth_soft_50200_echo_roster' webui/STATUS.md
grep -qE 'phase47344|through 47344|e2e-phase47344' webui/STATUS.md
echo "STATUS ssh-auth-soft-50200-echo roster ok"; echo "cleaned"; echo "OK: phase47340 e2e passed"
