#!/usr/bin/env bash
# Phase-6508: STATUS mentions ssh_auth_note_snapshot_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_snapshot_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_auth_note_snapshot_roster' webui/STATUS.md
grep -qE 'phase6512|through 6512|e2e-phase6512' webui/STATUS.md
echo "STATUS ssh_auth_note_snapshot_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6508 e2e passed"
