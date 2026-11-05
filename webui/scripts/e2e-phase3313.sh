#!/usr/bin/env bash
# Phase-3313: honesty milestone 8450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8450
assert "checkpoint 8450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "catalogSummaryRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3320
print("milestone 8450 ok")
PY
echo "cleaned"
echo "OK: phase3313 e2e passed"
