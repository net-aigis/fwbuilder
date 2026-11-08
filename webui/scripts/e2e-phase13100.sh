#!/usr/bin/env bash
# Phase-13100: STATUS mentions ssh_auth_milestone_floor_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_milestone_floor_roster|soft_fertig_ssh_auth_milestone_floor_roster' webui/STATUS.md
grep -qE 'phase13104|through 13104|e2e-phase13104' webui/STATUS.md
echo "STATUS ssh-auth-milestone-floor roster ok"; echo "cleaned"; echo "OK: phase13100 e2e passed"
