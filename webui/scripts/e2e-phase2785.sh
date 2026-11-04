#!/usr/bin/env bash
# Phase-2785: honesty milestone 6800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6800
assert "checkpoint 6800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "changelog" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2792
print("milestone 6800 ok")
PY
echo "cleaned"
echo "OK: phase2785 e2e passed"
