#!/usr/bin/env bash
# Phase-3265: honesty milestone 8300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8300
assert "checkpoint 8300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "catalog_summary" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3272
print("milestone 8300 ok")
PY
echo "cleaned"
echo "OK: phase3265 e2e passed"
