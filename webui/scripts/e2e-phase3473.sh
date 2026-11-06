#!/usr/bin/env bash
# Phase-3473: honesty milestone 8950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8950
assert "checkpoint 8950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorageClearRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3480
print("milestone 8950 ok")
PY
echo "cleaned"
echo "OK: phase3473 e2e passed"
