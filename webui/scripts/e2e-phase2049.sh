#!/usr/bin/env bash
# Phase-2049: honesty milestone 4500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4500
assert "checkpoint 4500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "softCompleteNote" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2056
print("milestone 4500 ok")
PY
echo "cleaned"
echo "OK: phase2049 e2e passed"
