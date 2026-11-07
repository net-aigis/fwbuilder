#!/usr/bin/env bash
# Phase-4417: honesty milestone 11900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11900
assert "checkpoint 11900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.5" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4424
print("milestone 11900 ok")
PY
echo "cleaned"
echo "OK: phase4417 e2e passed"
