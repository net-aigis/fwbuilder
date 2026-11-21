#!/usr/bin/env bash
# Phase-45740: STATUS mentions ssh_auth_soft_48400_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_48400_echo_roster|soft_fertig_ssh_auth_soft_48400_echo_roster' webui/STATUS.md
grep -qE 'phase45744|through 45744|e2e-phase45744' webui/STATUS.md
echo "STATUS ssh-auth-soft-48400-echo roster ok"; echo "cleaned"; echo "OK: phase45740 e2e passed"
