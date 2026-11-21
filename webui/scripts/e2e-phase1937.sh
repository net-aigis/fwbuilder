#!/usr/bin/env bash
# Phase-1937: honesty milestone 4150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4150
assert "checkpoint 4150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.3" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1944
print("milestone 4150 ok")
PY
echo "cleaned"
echo "OK: phase1937 e2e passed"
