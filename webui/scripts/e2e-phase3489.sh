#!/usr/bin/env bash
# Phase-3489: honesty milestone 9000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9000
assert "checkpoint 9000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "3480" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3496
print("milestone 9000 ok")
PY
echo "cleaned"
echo "OK: phase3489 e2e passed"
