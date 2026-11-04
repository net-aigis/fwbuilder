#!/usr/bin/env bash
# Phase-1177: honesty milestone 1800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1800
assert "checkpoint 1800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expect_plan_step_titles" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1800
assert isinstance(h.get("expect_plan_step_titles"), dict)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1184
print("milestone 1800 ok")
PY
echo "cleaned"
echo "OK: phase1177 e2e passed"
