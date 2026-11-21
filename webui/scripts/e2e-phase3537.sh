#!/usr/bin/env bash
# Phase-3537: honesty milestone 9150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9150
assert "checkpoint 9150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.4" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3544
print("milestone 9150 ok")
PY
echo "cleaned"
echo "OK: phase3537 e2e passed"
