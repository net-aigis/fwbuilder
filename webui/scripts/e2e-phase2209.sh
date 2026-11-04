#!/usr/bin/env bash
# Phase-2209: honesty milestone 5000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5000
assert "checkpoint 5000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2200" in m.WEBUI_HONESTY_MILESTONE_NOTE or "Soft 2200" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2216
print("milestone 5000 ok")
PY
echo "cleaned"
echo "OK: phase2209 e2e passed"
