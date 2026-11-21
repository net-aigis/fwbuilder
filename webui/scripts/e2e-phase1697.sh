#!/usr/bin/env bash
# Phase-1697: honesty milestone 3400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3400
assert "checkpoint 3400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1704
print("milestone 3400 ok")
PY
echo "cleaned"
echo "OK: phase1697 e2e passed"
