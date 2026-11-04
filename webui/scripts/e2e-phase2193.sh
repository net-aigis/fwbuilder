#!/usr/bin/env bash
# Phase-2193: honesty milestone 4950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4950
assert "checkpoint 4950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "honestyOperatorBrief" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2200
print("milestone 4950 ok")
PY
echo "cleaned"
echo "OK: phase2193 e2e passed"
