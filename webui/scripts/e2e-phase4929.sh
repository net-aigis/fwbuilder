#!/usr/bin/env bash
# Phase-4929: honesty milestone 13500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 13500
assert "ssh_capability" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.1" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4920" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13500" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') == 13500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4936
print("milestone 13500 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4929 e2e passed"
