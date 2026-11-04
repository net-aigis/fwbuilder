#!/usr/bin/env bash
# Phase-681: honesty milestone 700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 700
assert "checkpoint 700" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 700
assert "expect_plan_step_notes" in (h.get("honesty_milestone_note") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 688
print("milestone 700 ok")
PY
echo "cleaned"
echo "OK: phase681 e2e passed"
