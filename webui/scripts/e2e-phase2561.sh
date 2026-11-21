#!/usr/bin/env bash
# Phase-2561: honesty milestone 6100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6100
assert "checkpoint 6100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2568
print("milestone 6100 ok")
PY
echo "cleaned"
echo "OK: phase2561 e2e passed"
