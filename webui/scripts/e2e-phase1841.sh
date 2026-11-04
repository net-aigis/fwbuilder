#!/usr/bin/env bash
# Phase-1841: honesty milestone 3850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3850
assert "checkpoint 3850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert (
    "track_note" in m.WEBUI_HONESTY_MILESTONE_NOTE
    or "soft_fertig_honesty_track_note" in m.WEBUI_HONESTY_MILESTONE_NOTE
)
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1848
print("milestone 3850 ok")
PY
echo "cleaned"
echo "OK: phase1841 e2e passed"
