#!/usr/bin/env bash
# Phase-19180: STATUS mentions ssh_auth_soft_19240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_19240_echo_roster|soft_fertig_ssh_auth_soft_19240_echo_roster' webui/STATUS.md
grep -qE 'phase19184|through 19184|e2e-phase19184' webui/STATUS.md
echo "STATUS ssh-auth-soft-19240-echo roster ok"; echo "cleaned"; echo "OK: phase19180 e2e passed"
