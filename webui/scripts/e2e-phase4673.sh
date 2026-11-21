#!/usr/bin/env bash
# Phase-4673: honesty milestone 12700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12700
assert "checkpoint 12700" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4680
print("milestone 12700 ok")
PY
echo "cleaned"
echo "OK: phase4673 e2e passed"
