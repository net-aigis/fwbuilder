#!/usr/bin/env bash
# Phase-2769: honesty milestone 6750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6750
assert "checkpoint 6750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2760" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2776
print("milestone 6750 ok")
PY
echo "cleaned"
echo "OK: phase2769 e2e passed"
