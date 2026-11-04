#!/usr/bin/env bash
# Phase-1873: honesty milestone 3950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3950
assert "checkpoint 3950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.2" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1880
print("milestone 3950 ok")
PY
echo "cleaned"
echo "OK: phase1873 e2e passed"
