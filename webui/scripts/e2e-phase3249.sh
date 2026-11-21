#!/usr/bin/env bash
# Phase-3249: honesty milestone 8250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8250
assert "checkpoint 8250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3240" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3256
print("milestone 8250 ok")
PY
echo "cleaned"
echo "OK: phase3249 e2e passed"
