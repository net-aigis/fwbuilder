#!/usr/bin/env bash
# Phase-665: expect_plan_step_notes_count + summary expect_plan_step_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
h = m.hard_gaps()
assert h.get("expect_plan_step_notes_count") == len(h.get("expect_plan_step_notes") or {})
assert h["expect_plan_step_notes_count"] == 8
s = m.hard_gaps_summary()
assert s.get("expect_plan_step_count") == 8
assert s.get("expect_steps_path") == "/api/v1/expect-install-plan/steps"
assert "step_notes" in (m.HARD_GAP_NOTES.get("expect_sshsession_runtime") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 672
print("step notes count ok")
PY
echo "cleaned"
echo "OK: phase665 e2e passed"
