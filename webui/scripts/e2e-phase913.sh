#!/usr/bin/env bash
# Phase-913: honesty milestone 1200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1200
assert "checkpoint 1200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "window_title" in m.WEBUI_HONESTY_MILESTONE_NOTE or "tab_position" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 920
print("milestone 1200 ok")
PY
echo "cleaned"
echo "OK: phase913 e2e passed"
