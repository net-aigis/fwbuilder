#!/usr/bin/env bash
# Phase-2865: honesty milestone 7050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7050
assert "checkpoint 7050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "expect" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2872
print("milestone 7050 ok")
PY
echo "cleaned"
echo "OK: phase2865 e2e passed"
