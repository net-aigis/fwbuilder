#!/usr/bin/env bash
# Phase-1041: honesty milestone 1400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1400
assert "checkpoint 1400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "with_enabled" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "pages_with_tooltip" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1048
print("milestone 1400 ok")
PY
echo "cleaned"
echo "OK: phase1041 e2e passed"
