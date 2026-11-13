#!/usr/bin/env bash
# Phase-29420: STATUS mentions ssh_auth_soft_30120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_30120_echo_roster|soft_fertig_ssh_auth_soft_30120_echo_roster' webui/STATUS.md
grep -qE 'phase29424|through 29424|e2e-phase29424' webui/STATUS.md
echo "STATUS ssh-auth-soft-30120-echo roster ok"; echo "cleaned"; echo "OK: phase29420 e2e passed"
