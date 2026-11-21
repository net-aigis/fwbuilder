#!/usr/bin/env bash
# Phase-3569: honesty milestone 9250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9250
assert "checkpoint 9250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3560" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3576
print("milestone 9250 ok")
PY
echo "cleaned"
echo "OK: phase3569 e2e passed"
