#!/usr/bin/env bash
# Phase-4273: honesty milestone 11450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11450
assert "checkpoint 11450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4280
print("milestone 11450 ok")
PY
echo "cleaned"
echo "OK: phase4273 e2e passed"
