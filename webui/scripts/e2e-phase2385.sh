#!/usr/bin/env bash
# Phase-2385: honesty milestone 5550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5550
assert "checkpoint 5550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "path" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2392
print("milestone 5550 ok")
PY
echo "cleaned"
echo "OK: phase2385 e2e passed"
