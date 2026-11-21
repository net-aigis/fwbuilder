#!/usr/bin/env bash
# Phase-4385: honesty milestone 11800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11800
assert "checkpoint 11800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expect_steps" in m.WEBUI_HONESTY_MILESTONE_NOTE or "expect-steps" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4392
print("milestone 11800 ok")
PY
echo "cleaned"
echo "OK: phase4385 e2e passed"
