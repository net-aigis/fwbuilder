#!/usr/bin/env bash
# Phase-2417: honesty milestone 5650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5650
assert "checkpoint 5650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.0" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2424
print("milestone 5650 ok")
PY
echo "cleaned"
echo "OK: phase2417 e2e passed"
