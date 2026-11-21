#!/usr/bin/env bash
# Phase-3905: honesty milestone 10300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10300
assert "checkpoint 10300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "res-status" in m.WEBUI_HONESTY_MILESTONE_NOTE or "res_status" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3912
print("milestone 10300 ok")
PY
echo "cleaned"
echo "OK: phase3905 e2e passed"
