#!/usr/bin/env bash
# Phase-4593: honesty milestone 12450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12450
assert "checkpoint 12450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4600
print("milestone 12450 ok")
PY
echo "cleaned"
echo "OK: phase4593 e2e passed"
