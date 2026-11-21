#!/usr/bin/env bash
# Phase-1441: honesty milestone 2600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2600
assert "checkpoint 2600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honesty_paths" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2600
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1448
print("milestone 2600 ok")
PY
echo "cleaned"
echo "OK: phase1441 e2e passed"
