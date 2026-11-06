#!/usr/bin/env bash
# Phase-3857: honesty milestone 10150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10150
assert "checkpoint 10150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.8" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3864
print("milestone 10150 ok")
PY
echo "cleaned"
echo "OK: phase3857 e2e passed"
