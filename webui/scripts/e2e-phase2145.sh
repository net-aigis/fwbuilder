#!/usr/bin/env bash
# Phase-2145: honesty milestone 4800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4800
assert "checkpoint 4800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "operator_brief" in m.WEBUI_HONESTY_MILESTONE_NOTE or "operator" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2152
print("milestone 4800 ok")
PY
echo "cleaned"
echo "OK: phase2145 e2e passed"
