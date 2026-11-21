#!/usr/bin/env bash
# Phase-2497: honesty milestone 5900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5900
assert "checkpoint 5900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.1" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2504
print("milestone 5900 ok")
PY
echo "cleaned"
echo "OK: phase2497 e2e passed"
