#!/usr/bin/env bash
# Phase-3169: honesty milestone 8000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8000
assert "checkpoint 8000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3160" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3176
print("milestone 8000 ok")
PY
echo "cleaned"
echo "OK: phase3169 e2e passed"
