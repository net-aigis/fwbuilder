#!/usr/bin/env bash
# Phase-1065: honesty milestone 1450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1450
assert "checkpoint 1450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "pages_with_buddy_labels" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "catalog" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1072
print("milestone 1450 ok")
PY
echo "cleaned"
echo "OK: phase1065 e2e passed"
