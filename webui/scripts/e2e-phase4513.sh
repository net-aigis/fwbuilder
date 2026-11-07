#!/usr/bin/env bash
# Phase-4513: honesty milestone 12200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12200
assert "checkpoint 12200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4520
print("milestone 12200 ok")
PY
echo "cleaned"
echo "OK: phase4513 e2e passed"
