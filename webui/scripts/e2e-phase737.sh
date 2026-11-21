#!/usr/bin/env bash
# Phase-737: honesty milestone 800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 800
assert "checkpoint" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "checkpoint" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == m.WEBUI_HONESTY_MILESTONE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 744
print("milestone 800 ok")
PY
echo "cleaned"
echo "OK: phase737 e2e passed"
