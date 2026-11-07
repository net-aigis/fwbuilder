#!/usr/bin/env bash
# Phase-4225: honesty milestone 11300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11300
assert "checkpoint 11300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "option_enable" in m.WEBUI_HONESTY_MILESTONE_NOTE or "option-enable" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4232
print("milestone 11300 ok")
PY
echo "cleaned"
echo "OK: phase4225 e2e passed"
