#!/usr/bin/env bash
# Phase-2033: honesty milestone 4450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4450
assert "checkpoint 4450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.5" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2040
print("milestone 4450 ok")
PY
echo "cleaned"
echo "OK: phase2033 e2e passed"
