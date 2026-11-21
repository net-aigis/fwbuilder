#!/usr/bin/env bash
# Phase-3153: honesty milestone 7950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7950
assert "checkpoint 7950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "layoutFidelitySampleRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3160
print("milestone 7950 ok")
PY
echo "cleaned"
echo "OK: phase3153 e2e passed"
