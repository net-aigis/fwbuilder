#!/usr/bin/env bash
# Phase-1921: honesty milestone 4100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4100
assert "checkpoint 4100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "readiness" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1928
print("milestone 4100 ok")
PY
echo "cleaned"
echo "OK: phase1921 e2e passed"
