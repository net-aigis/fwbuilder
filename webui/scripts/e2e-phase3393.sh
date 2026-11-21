#!/usr/bin/env bash
# Phase-3393: honesty milestone 8700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8700
assert "checkpoint 8700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honestyReadinessRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3400
print("milestone 8700 ok")
PY
echo "cleaned"
echo "OK: phase3393 e2e passed"
