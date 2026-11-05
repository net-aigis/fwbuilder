#!/usr/bin/env bash
# Phase-3137: honesty milestone 7900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7900
assert "checkpoint 7900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.9" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3144
print("milestone 7900 ok")
PY
echo "cleaned"
echo "OK: phase3137 e2e passed"
