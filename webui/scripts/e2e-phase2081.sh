#!/usr/bin/env bash
# Phase-2081: honesty milestone 4600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4600
assert "checkpoint 4600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "changelog" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4600
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2088
print("milestone 4600 ok")
PY
echo "cleaned"
echo "OK: phase2081 e2e passed"
