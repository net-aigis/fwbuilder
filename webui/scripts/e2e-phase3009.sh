#!/usr/bin/env bash
# Phase-3009: honesty milestone 7500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7500
assert "checkpoint 7500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3000" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3016
print("milestone 7500 ok")
PY
echo "cleaned"
echo "OK: phase3009 e2e passed"
