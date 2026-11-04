#!/usr/bin/env bash
# Phase-2689: honesty milestone 6500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6500
assert "checkpoint 6500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2680" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2696
print("milestone 6500 ok")
PY
echo "cleaned"
echo "OK: phase2689 e2e passed"
