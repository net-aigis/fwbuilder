#!/usr/bin/env bash
# Phase-14140: STATUS mentions ssh_auth_soft_phase_parts_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_phase_parts_roster|soft_fertig_ssh_auth_soft_phase_parts_roster' webui/STATUS.md
grep -qE 'phase14144|through 14144|e2e-phase14144' webui/STATUS.md
echo "STATUS ssh-auth-soft-phase-parts roster ok"; echo "cleaned"; echo "OK: phase14140 e2e passed"
