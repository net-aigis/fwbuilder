#!/usr/bin/env bash
# Phase-4337: honesty milestone 11650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11650
assert "checkpoint 11650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.4" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4344
print("milestone 11650 ok")
PY
echo "cleaned"
echo "OK: phase4337 e2e passed"
