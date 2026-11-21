#!/usr/bin/env bash
# Phase-3297: honesty milestone 8400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8400
assert "checkpoint 8400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.1" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3304
print("milestone 8400 ok")
PY
echo "cleaned"
echo "OK: phase3297 e2e passed"
