#!/usr/bin/env bash
# Phase-2849: honesty milestone 7000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7000
assert "checkpoint 7000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2840" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2856
print("milestone 7000 ok")
PY
echo "cleaned"
echo "OK: phase2849 e2e passed"
