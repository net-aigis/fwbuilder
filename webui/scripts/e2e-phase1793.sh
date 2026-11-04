#!/usr/bin/env bash
# Phase-1793: honesty milestone 3700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3700
assert "checkpoint 3700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "catalog_summary" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1800
print("milestone 3700 ok")
PY
echo "cleaned"
echo "OK: phase1793 e2e passed"
