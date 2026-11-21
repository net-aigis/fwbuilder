#!/usr/bin/env bash
# Phase-2513: honesty milestone 5950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5950
assert "checkpoint 5950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorageRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2520
print("milestone 5950 ok")
PY
echo "cleaned"
echo "OK: phase2513 e2e passed"
