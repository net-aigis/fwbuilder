#!/usr/bin/env bash
# Phase-1825: honesty milestone 3800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3800
assert "checkpoint 3800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_honesty_track_note" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1832
print("milestone 3800 ok")
PY
echo "cleaned"
echo "OK: phase1825 e2e passed"
