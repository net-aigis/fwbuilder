#!/usr/bin/env bash
# Phase-3025: honesty milestone 7550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7550
assert "checkpoint 7550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "layout" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "signal" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3032
print("milestone 7550 ok")
PY
echo "cleaned"
echo "OK: phase3025 e2e passed"
