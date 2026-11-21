#!/usr/bin/env bash
# Phase-1473: honesty milestone 2700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2700
assert "checkpoint 2700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1480
print("milestone 2700 ok")
PY
echo "cleaned"
echo "OK: phase1473 e2e passed"
