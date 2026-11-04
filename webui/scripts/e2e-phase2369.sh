#!/usr/bin/env bash
# Phase-2369: honesty milestone 5500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5500
assert "checkpoint 5500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2360" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2376
print("milestone 5500 ok")
PY
echo "cleaned"
echo "OK: phase2369 e2e passed"
