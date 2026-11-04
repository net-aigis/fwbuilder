#!/usr/bin/env bash
# Phase-1425: honesty milestone 2550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2550
assert "checkpoint 2550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gap_related_refusals" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1432
print("milestone 2550 ok")
PY
echo "cleaned"
echo "OK: phase1425 e2e passed"
