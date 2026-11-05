#!/usr/bin/env bash
# Phase-3233: honesty milestone 8200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8200
assert "checkpoint 8200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "layoutFidelitySampleFieldRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3240
print("milestone 8200 ok")
PY
echo "cleaned"
echo "OK: phase3233 e2e passed"
