#!/usr/bin/env bash
# Phase-4529: honesty milestone 12250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12250
assert "checkpoint 12250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4520" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4536
print("milestone 12250 ok")
PY
echo "cleaned"
echo "OK: phase4529 e2e passed"
