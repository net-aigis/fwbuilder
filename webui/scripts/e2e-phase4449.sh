#!/usr/bin/env bash
# Phase-4449: honesty milestone 12000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12000
assert "checkpoint 12000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4440" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4456
print("milestone 12000 ok")
PY
echo "cleaned"
echo "OK: phase4449 e2e passed"
