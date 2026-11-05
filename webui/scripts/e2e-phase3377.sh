#!/usr/bin/env bash
# Phase-3377: honesty milestone 8650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8650
assert "checkpoint 8650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.2" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3384
print("milestone 8650 ok")
PY
echo "cleaned"
echo "OK: phase3377 e2e passed"
