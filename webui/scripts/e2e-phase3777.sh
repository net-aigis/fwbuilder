#!/usr/bin/env bash
# Phase-3777: honesty milestone 9900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9900
assert "checkpoint 9900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3.7" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3784
print("milestone 9900 ok")
PY
echo "cleaned"
echo "OK: phase3777 e2e passed"
