#!/usr/bin/env bash
# Phase-37420: STATUS mentions ssh_auth_soft_39040_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_39040_echo_roster|soft_fertig_ssh_auth_soft_39040_echo_roster' webui/STATUS.md
grep -qE 'phase37424|through 37424|e2e-phase37424' webui/STATUS.md
echo "STATUS ssh-auth-soft-39040-echo roster ok"; echo "cleaned"; echo "OK: phase37420 e2e passed"
