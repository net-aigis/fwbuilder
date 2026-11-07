#!/usr/bin/env bash
# Phase-4657: honesty milestone 12650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12650
assert "checkpoint 12650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.8" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4664
print("milestone 12650 ok")
PY
echo "cleaned"
echo "OK: phase4657 e2e passed"
