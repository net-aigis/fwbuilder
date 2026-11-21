#!/usr/bin/env bash
# Phase-2593: honesty milestone 6200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6200
assert "checkpoint 6200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honestyExportRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2600
print("milestone 6200 ok")
PY
echo "cleaned"
echo "OK: phase2593 e2e passed"
