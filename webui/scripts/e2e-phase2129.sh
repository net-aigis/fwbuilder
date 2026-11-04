#!/usr/bin/env bash
# Phase-2129: honesty milestone 4750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4750
assert "checkpoint 4750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "honestySurfaceChangelog" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2136
print("milestone 4750 ok")
PY
echo "cleaned"
echo "OK: phase2129 e2e passed"
