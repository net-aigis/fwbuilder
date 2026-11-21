#!/usr/bin/env bash
# Phase-3729: honesty milestone 9750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9750
assert "checkpoint 9750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3720" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3736
print("milestone 9750 ok")
PY
echo "cleaned"
echo "OK: phase3729 e2e passed"
