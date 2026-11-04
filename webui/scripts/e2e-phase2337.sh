#!/usr/bin/env bash
# Phase-2337: honesty milestone 5400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5400
assert "checkpoint 5400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.9" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2344
print("milestone 5400 ok")
PY
echo "cleaned"
echo "OK: phase2337 e2e passed"
