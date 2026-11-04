#!/usr/bin/env bash
# Phase-2321: honesty milestone 5350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5350
assert "checkpoint 5350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2328
print("milestone 5350 ok")
PY
echo "cleaned"
echo "OK: phase2321 e2e passed"
