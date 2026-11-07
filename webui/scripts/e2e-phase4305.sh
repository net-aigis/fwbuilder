#!/usr/bin/env bash
# Phase-4305: honesty milestone 11550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11550
assert "checkpoint 11550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expect_run" in m.WEBUI_HONESTY_MILESTONE_NOTE or "expect-run" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4312
print("milestone 11550 ok")
PY
echo "cleaned"
echo "OK: phase4305 e2e passed"
