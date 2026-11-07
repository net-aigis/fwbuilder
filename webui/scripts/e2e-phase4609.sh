#!/usr/bin/env bash
# Phase-4609: honesty milestone 12500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12500
assert "checkpoint 12500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4600" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4616
print("milestone 12500 ok")
PY
echo "cleaned"
echo "OK: phase4609 e2e passed"
