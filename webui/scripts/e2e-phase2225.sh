#!/usr/bin/env bash
# Phase-2225: honesty milestone 5050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5050
assert "checkpoint 5050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "roster" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2232
print("milestone 5050 ok")
PY
echo "cleaned"
echo "OK: phase2225 e2e passed"
