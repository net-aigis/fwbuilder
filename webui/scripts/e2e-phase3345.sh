#!/usr/bin/env bash
# Phase-3345: honesty milestone 8550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8550
assert "checkpoint 8550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "readiness" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3352
print("milestone 8550 ok")
PY
echo "cleaned"
echo "OK: phase3345 e2e passed"
