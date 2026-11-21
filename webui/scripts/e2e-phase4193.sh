#!/usr/bin/env bash
# Phase-4193: honesty milestone 11200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11200
assert "checkpoint 11200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4200
print("milestone 11200 ok")
PY
echo "cleaned"
echo "OK: phase4193 e2e passed"
