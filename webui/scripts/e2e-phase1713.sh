#!/usr/bin/env bash
# Phase-1713: honesty milestone 3450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3450
assert "checkpoint 3450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "session_storage_clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1720
print("milestone 3450 ok")
PY
echo "cleaned"
echo "OK: phase1713 e2e passed"
