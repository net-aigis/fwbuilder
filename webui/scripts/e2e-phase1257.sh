#!/usr/bin/env bash
# Phase-1257: honesty milestone 2050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2050
assert "checkpoint 2050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "hard_gap_related_refusals" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2050
assert isinstance(h.get("hard_gap_related_refusals"), dict)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1264
print("milestone 2050 ok")
PY
echo "cleaned"
echo "OK: phase1257 e2e passed"
