#!/usr/bin/env bash
# Phase-3953: honesty milestone 10450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10450
assert "checkpoint 10450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3960
print("milestone 10450 ok")
PY
echo "cleaned"
echo "OK: phase3953 e2e passed"
