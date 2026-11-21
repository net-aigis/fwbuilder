#!/usr/bin/env bash
# Phase-2017: honesty milestone 4400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4400
assert "checkpoint 4400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_complete_note" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2024
print("milestone 4400 ok")
PY
echo "cleaned"
echo "OK: phase2017 e2e passed"
