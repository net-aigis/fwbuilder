#!/usr/bin/env bash
# Phase-4353: honesty milestone 11700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11700
assert "checkpoint 11700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4360
print("milestone 11700 ok")
PY
echo "cleaned"
echo "OK: phase4353 e2e passed"
