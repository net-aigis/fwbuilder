#!/usr/bin/env bash
# Phase-2545: honesty milestone 6050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6050
assert "checkpoint 6050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2552
print("milestone 6050 ok")
PY
echo "cleaned"
echo "OK: phase2545 e2e passed"
