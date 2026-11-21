#!/usr/bin/env bash
# Phase-4065: honesty milestone 10800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10800
assert "checkpoint 10800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "layout_fidelity" in m.WEBUI_HONESTY_MILESTONE_NOTE or "layout-fidelity" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4072
print("milestone 10800 ok")
PY
echo "cleaned"
echo "OK: phase4065 e2e passed"
