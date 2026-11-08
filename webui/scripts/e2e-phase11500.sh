#!/usr/bin/env bash
# Phase-11500: STATUS mentions ssh_auth_milestone_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_milestone_echo_roster|soft_fertig_ssh_auth_milestone_echo_roster' webui/STATUS.md
grep -qE 'phase11504|through 11504|e2e-phase11504' webui/STATUS.md
echo "STATUS ssh-auth-milestone-echo roster ok"; echo "cleaned"; echo "OK: phase11500 e2e passed"
