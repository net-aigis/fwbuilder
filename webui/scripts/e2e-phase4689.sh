#!/usr/bin/env bash
# Phase-4689: honesty milestone 12750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12750
assert "checkpoint 12750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4680" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4696
print("milestone 12750 ok")
PY
echo "cleaned"
echo "OK: phase4689 e2e passed"
