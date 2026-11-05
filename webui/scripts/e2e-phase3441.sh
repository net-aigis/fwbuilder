#!/usr/bin/env bash
# Phase-3441: honesty milestone 8850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8850
assert "checkpoint 8850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3448
print("milestone 8850 ok")
PY
echo "cleaned"
echo "OK: phase3441 e2e passed"
