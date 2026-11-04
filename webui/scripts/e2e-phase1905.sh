#!/usr/bin/env bash
# Phase-1905: honesty milestone 4050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4050
assert "checkpoint 4050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "readiness" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1912
print("milestone 4050 ok")
PY
echo "cleaned"
echo "OK: phase1905 e2e passed"
