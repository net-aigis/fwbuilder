#!/usr/bin/env bash
# Phase-2753: honesty milestone 6700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6700
assert "checkpoint 6700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "surfaceRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2760
print("milestone 6700 ok")
PY
echo "cleaned"
echo "OK: phase2753 e2e passed"
