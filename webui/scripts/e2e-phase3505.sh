#!/usr/bin/env bash
# Phase-3505: honesty milestone 9050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9050
assert "checkpoint 9050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "operator_brief" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3512
print("milestone 9050 ok")
PY
echo "cleaned"
echo "OK: phase3505 e2e passed"
