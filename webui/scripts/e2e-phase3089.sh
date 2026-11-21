#!/usr/bin/env bash
# Phase-3089: honesty milestone 7750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7750
assert "checkpoint 7750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3080" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3096
print("milestone 7750 ok")
PY
echo "cleaned"
echo "OK: phase3089 e2e passed"
