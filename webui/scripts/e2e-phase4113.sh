#!/usr/bin/env bash
# Phase-4113: honesty milestone 10950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10950
assert "checkpoint 10950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4120
print("milestone 10950 ok")
PY
echo "cleaned"
echo "OK: phase4113 e2e passed"
