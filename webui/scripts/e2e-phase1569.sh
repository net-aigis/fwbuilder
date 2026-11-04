#!/usr/bin/env bash
# Phase-1569: honesty milestone 3000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3000
assert "checkpoint 3000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_notes" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1576
print("milestone 3000 ok")
PY
echo "cleaned"
echo "OK: phase1569 e2e passed"
