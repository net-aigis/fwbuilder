#!/usr/bin/env bash
# Phase-5009: honesty milestone 13750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 13750
assert "ssh_alternatives" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.2" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5000" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13750" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') == 13750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5016
print("milestone 13750 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5009 e2e passed"
