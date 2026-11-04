#!/usr/bin/env bash
# Phase-2737: honesty milestone 6650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6650
assert "checkpoint 6650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.4" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2744
print("milestone 6650 ok")
PY
echo "cleaned"
echo "OK: phase2737 e2e passed"
