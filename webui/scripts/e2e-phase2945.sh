#!/usr/bin/env bash
# Phase-2945: honesty milestone 7300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7300
assert "checkpoint 7300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2952
print("milestone 7300 ok")
PY
echo "cleaned"
echo "OK: phase2945 e2e passed"
