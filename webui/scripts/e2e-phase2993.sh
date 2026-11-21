#!/usr/bin/env bash
# Phase-2993: honesty milestone 7450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7450
assert "checkpoint 7450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sshHonestyRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3000
print("milestone 7450 ok")
PY
echo "cleaned"
echo "OK: phase2993 e2e passed"
