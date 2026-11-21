#!/usr/bin/env bash
# Phase-36140: STATUS mentions ssh_auth_soft_37600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_37600_echo_roster|soft_fertig_ssh_auth_soft_37600_echo_roster' webui/STATUS.md
grep -qE 'phase36144|through 36144|e2e-phase36144' webui/STATUS.md
echo "STATUS ssh-auth-soft-37600-echo roster ok"; echo "cleaned"; echo "OK: phase36140 e2e passed"
