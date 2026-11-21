#!/usr/bin/env bash
# Phase-3873: honesty milestone 10200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10200
assert "checkpoint 10200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3880
print("milestone 10200 ok")
PY
echo "cleaned"
echo "OK: phase3873 e2e passed"
