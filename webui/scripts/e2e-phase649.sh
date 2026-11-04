#!/usr/bin/env bash
# Phase-649: honesty milestone 650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 650
assert "Honesty surface checkpoint 650" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 650
assert "checkpoint 650" in (h.get("honesty_milestone_note") or "")
assert m.WEBUI_SOFT_COMPLETE_PHASE == "656"
print("milestone 650 ok")
PY
echo "cleaned"
echo "OK: phase649 e2e passed"
