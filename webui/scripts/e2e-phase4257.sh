#!/usr/bin/env bash
# Phase-4257: honesty milestone 11400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11400
assert "checkpoint 11400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.3" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4264
print("milestone 11400 ok")
PY
echo "cleaned"
echo "OK: phase4257 e2e passed"
