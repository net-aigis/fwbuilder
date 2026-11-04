#!/usr/bin/env bash
# Phase-1857: honesty milestone 3900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3900
assert "checkpoint 3900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honestyTrackNote" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1864
print("milestone 3900 ok")
PY
echo "cleaned"
echo "OK: phase1857 e2e passed"
