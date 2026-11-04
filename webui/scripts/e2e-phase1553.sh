#!/usr/bin/env bash
# Phase-1553: honesty milestone 2950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2950
assert "checkpoint 2950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_notes" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1560
print("milestone 2950 ok")
PY
echo "cleaned"
echo "OK: phase1553 e2e passed"
