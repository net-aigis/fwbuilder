#!/usr/bin/env bash
# Phase-1521: honesty milestone 2850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2850
assert "checkpoint 2850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_session_storage_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1528
print("milestone 2850 ok")
PY
echo "cleaned"
echo "OK: phase1521 e2e passed"
