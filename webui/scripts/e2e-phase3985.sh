#!/usr/bin/env bash
# Phase-3985: honesty milestone 10550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10550
assert "checkpoint 10550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gaps_field" in m.WEBUI_HONESTY_MILESTONE_NOTE or "hard-gaps" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3992
print("milestone 10550 ok")
PY
echo "cleaned"
echo "OK: phase3985 e2e passed"
