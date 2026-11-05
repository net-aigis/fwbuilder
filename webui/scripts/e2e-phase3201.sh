#!/usr/bin/env bash
# Phase-3201: honesty milestone 8100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8100
assert "checkpoint 8100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3208
print("milestone 8100 ok")
PY
echo "cleaned"
echo "OK: phase3201 e2e passed"
