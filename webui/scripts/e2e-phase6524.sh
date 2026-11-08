#!/usr/bin/env bash
# Phase-6524: STATUS Soft 6520+ ssh_auth_note_snapshot_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6536|ssh_auth_note_snapshot_roster' webui/STATUS.md
grep -qE 'phase6528|through 6528|e2e-phase6536' webui/STATUS.md
echo "STATUS Soft 6520+ ok"; echo "cleaned"; echo "OK: phase6524 e2e passed"
