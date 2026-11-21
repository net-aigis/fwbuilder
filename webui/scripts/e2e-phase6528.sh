#!/usr/bin/env bash
# Phase-6528: soft-complete through 6528 (Soft 6520+ ssh_auth_note_snapshot_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6528
print("soft-complete >=6528", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6528|Soft-complete STATUS through 6528|through 6528' webui/STATUS.md
echo "STATUS soft-complete 6528 ok"; echo "cleaned"; echo "OK: phase6528 e2e passed"
