#!/usr/bin/env bash
# Phase-4049: honesty milestone 10750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10750
assert "checkpoint 10750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4040" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4056
print("milestone 10750 ok")
PY
echo "cleaned"
echo "OK: phase4049 e2e passed"
