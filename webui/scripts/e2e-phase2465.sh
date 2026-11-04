#!/usr/bin/env bash
# Phase-2465: honesty milestone 5800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5800
assert "checkpoint 5800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "session" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2472
print("milestone 5800 ok")
PY
echo "cleaned"
echo "OK: phase2465 e2e passed"
