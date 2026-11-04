#!/usr/bin/env bash
# Phase-1745: honesty milestone 3550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3550
assert "checkpoint 3550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "surface_version" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1752
print("milestone 3550 ok")
PY
echo "cleaned"
echo "OK: phase1745 e2e passed"
