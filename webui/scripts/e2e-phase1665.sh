#!/usr/bin/env bash
# Phase-1665: honesty milestone 3300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3300
assert "checkpoint 3300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_clear_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1672
print("milestone 3300 ok")
PY
echo "cleaned"
echo "OK: phase1665 e2e passed"
