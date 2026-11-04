#!/usr/bin/env bash
# Phase-753: honesty milestone 850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 850
assert "checkpoint 850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "Minimum/Preferred/Fixed" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sizePolicy" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 760
print("milestone 850 ok")
PY
echo "cleaned"
echo "OK: phase753 e2e passed"
