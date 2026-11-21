#!/usr/bin/env bash
# Phase-2001: honesty milestone 4350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4350
assert "checkpoint 4350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_complete_note" in m.WEBUI_HONESTY_MILESTONE_NOTE or "soft-complete" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2008
print("milestone 4350 ok")
PY
echo "cleaned"
echo "OK: phase2001 e2e passed"
