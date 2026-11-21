#!/usr/bin/env bash
# Phase-1809: honesty milestone 3750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3750
assert "checkpoint 3750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.1" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1816
print("milestone 3750 ok")
PY
echo "cleaned"
echo "OK: phase1809 e2e passed"
