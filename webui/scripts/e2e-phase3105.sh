#!/usr/bin/env bash
# Phase-3105: honesty milestone 7800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7800
assert "checkpoint 7800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sample" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "layout" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3112
print("milestone 7800 ok")
PY
echo "cleaned"
echo "OK: phase3105 e2e passed"
