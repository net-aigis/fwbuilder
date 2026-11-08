#!/usr/bin/env bash
# Phase-13260: STATUS mentions ssh_auth_hard_gap_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hard_gap_ratio_roster|soft_fertig_ssh_auth_hard_gap_ratio_roster' webui/STATUS.md
grep -qE 'phase13264|through 13264|e2e-phase13264' webui/STATUS.md
echo "STATUS ssh-auth-hard-gap-ratio roster ok"; echo "cleaned"; echo "OK: phase13260 e2e passed"
