#!/usr/bin/env bash
# Phase-1161: honesty milestone 1750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1750
assert "checkpoint 1750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gap_closure_titles" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1750
assert isinstance(h.get("hard_gap_closure_titles"), dict)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1168
print("milestone 1750 ok")
PY
echo "cleaned"
echo "OK: phase1161 e2e passed"
