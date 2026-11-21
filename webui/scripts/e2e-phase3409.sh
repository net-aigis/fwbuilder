#!/usr/bin/env bash
# Phase-3409: honesty milestone 8750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8750
assert "checkpoint 8750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3400" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3416
print("milestone 8750 ok")
PY
echo "cleaned"
echo "OK: phase3409 e2e passed"
