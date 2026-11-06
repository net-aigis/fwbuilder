#!/usr/bin/env bash
# Phase-3809: honesty milestone 10000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10000
assert "checkpoint 10000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3800" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3816
print("milestone 10000 ok")
PY
echo "cleaned"
echo "OK: phase3809 e2e passed"
