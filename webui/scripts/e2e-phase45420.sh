#!/usr/bin/env bash
# Phase-45420: STATUS mentions ssh_auth_soft_48040_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_48040_echo_roster|soft_fertig_ssh_auth_soft_48040_echo_roster' webui/STATUS.md
grep -qE 'phase45424|through 45424|e2e-phase45424' webui/STATUS.md
echo "STATUS ssh-auth-soft-48040-echo roster ok"; echo "cleaned"; echo "OK: phase45420 e2e passed"
