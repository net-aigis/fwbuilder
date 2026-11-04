#!/usr/bin/env bash
# Phase-2657: honesty milestone 6400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6400
assert "checkpoint 6400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.3" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2664
print("milestone 6400 ok")
PY
echo "cleaned"
echo "OK: phase2657 e2e passed"
