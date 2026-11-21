#!/usr/bin/env bash
# Phase-1953: honesty milestone 4200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4200
assert "checkpoint 4200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honestyReadiness" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1960
print("milestone 4200 ok")
PY
echo "cleaned"
echo "OK: phase1953 e2e passed"
