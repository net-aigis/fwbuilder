#!/usr/bin/env bash
# Phase-4145: honesty milestone 11050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11050
assert "checkpoint 11050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "stack_switch" in m.WEBUI_HONESTY_MILESTONE_NOTE or "stack-switch" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4152
print("milestone 11050 ok")
PY
echo "cleaned"
echo "OK: phase4145 e2e passed"
