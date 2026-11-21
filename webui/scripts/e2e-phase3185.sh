#!/usr/bin/env bash
# Phase-3185: honesty milestone 8050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8050
assert "checkpoint 8050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sample" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "field" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3192
print("milestone 8050 ok")
PY
echo "cleaned"
echo "OK: phase3185 e2e passed"
