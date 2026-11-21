#!/usr/bin/env bash
# Phase-2065: honesty milestone 4550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4550
assert "checkpoint 4550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expandable" in m.WEBUI_HONESTY_MILESTONE_NOTE or "restore" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2072
print("milestone 4550 ok")
PY
echo "cleaned"
echo "OK: phase2065 e2e passed"
