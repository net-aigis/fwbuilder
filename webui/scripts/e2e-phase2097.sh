#!/usr/bin/env bash
# Phase-2097: honesty milestone 4650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4650
assert "checkpoint 4650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2104
print("milestone 4650 ok")
PY
echo "cleaned"
echo "OK: phase2097 e2e passed"
