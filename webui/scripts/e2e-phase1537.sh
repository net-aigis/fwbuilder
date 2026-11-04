#!/usr/bin/env bash
# Phase-1537: honesty milestone 2900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2900
assert "checkpoint 2900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1544
print("milestone 2900 ok")
PY
echo "cleaned"
echo "OK: phase1537 e2e passed"
