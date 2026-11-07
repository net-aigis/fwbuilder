#!/usr/bin/env bash
# Phase-4465: honesty milestone 12050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12050
assert "checkpoint 12050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expect_steps_refusals" in m.WEBUI_HONESTY_MILESTONE_NOTE or "expect-steps-refusals" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4472
print("milestone 12050 ok")
PY
echo "cleaned"
echo "OK: phase4465 e2e passed"
