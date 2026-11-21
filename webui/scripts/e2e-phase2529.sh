#!/usr/bin/env bash
# Phase-2529: honesty milestone 6000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6000
assert "checkpoint 6000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2520" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2536
print("milestone 6000 ok")
PY
echo "cleaned"
echo "OK: phase2529 e2e passed"
