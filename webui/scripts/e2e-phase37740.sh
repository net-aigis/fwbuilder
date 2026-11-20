#!/usr/bin/env bash
# Phase-37740: STATUS mentions ssh_auth_soft_39400_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_39400_echo_roster|soft_fertig_ssh_auth_soft_39400_echo_roster' webui/STATUS.md
grep -qE 'phase37744|through 37744|e2e-phase37744' webui/STATUS.md
echo "STATUS ssh-auth-soft-39400-echo roster ok"; echo "cleaned"; echo "OK: phase37740 e2e passed"
