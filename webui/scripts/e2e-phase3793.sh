#!/usr/bin/env bash
# Phase-3793: honesty milestone 9950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9950
assert "checkpoint 9950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "clear" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3800
print("milestone 9950 ok")
PY
echo "cleaned"
echo "OK: phase3793 e2e passed"
