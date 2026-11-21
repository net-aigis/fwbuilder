#!/usr/bin/env bash
# Phase-1305: soft_fertig_surface_notes on hard-gaps (+ count on summary).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.SOFT_FERTIG_SURFACE_NOTES) >= 23
h = m.hard_gaps()
s = m.hard_gaps_summary()
notes = h.get("soft_fertig_surface_notes") or {}
assert set(notes) == set(m.SOFT_FERTIG_SURFACE_KEYS)
assert h.get("soft_fertig_surface_notes_count") == len(notes)
assert s.get("soft_fertig_surface_notes_count") == len(notes)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1312
print("surface notes", len(notes))
PY
echo "cleaned"
echo "OK: phase1305 e2e passed"
