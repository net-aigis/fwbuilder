#!/usr/bin/env bash
# Phase-1313: honesty milestone 2200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2200
assert "checkpoint 2200" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_surface_notes" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2200
assert int(h.get("soft_fertig_surface_notes_count") or 0) >= 23
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1320
print("milestone 2200 ok")
PY
echo "cleaned"
echo "OK: phase1313 e2e passed"
