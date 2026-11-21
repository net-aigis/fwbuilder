#!/usr/bin/env bash
# Phase-1377: honesty milestone 2400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2400
assert "checkpoint 2400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honesty_paths" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1384
print("milestone 2400 ok")
PY
echo "cleaned"
echo "OK: phase1377 e2e passed"
