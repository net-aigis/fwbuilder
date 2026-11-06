#!/usr/bin/env bash
# Phase-3937: honesty milestone 10400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10400
assert "checkpoint 10400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.9" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3944
print("milestone 10400 ok")
PY
echo "cleaned"
echo "OK: phase3937 e2e passed"
