#!/usr/bin/env bash
# Phase-1681: honesty milestone 3350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3350
assert "checkpoint 3350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1688
print("milestone 3350 ok")
PY
echo "cleaned"
echo "OK: phase1681 e2e passed"
