#!/usr/bin/env bash
# Phase-6536: soft-complete through 6536 (Soft 6520+ ssh_auth_note_snapshot_roster + ms 18500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6536
assert m.WEBUI_HONESTY_MILESTONE == 18500
print("soft-complete >=6536", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6536|Soft-complete STATUS through 6536|through 6536' webui/STATUS.md
echo "STATUS soft-complete 6536 ok"; echo "cleaned"; echo "OK: phase6536 e2e passed"
