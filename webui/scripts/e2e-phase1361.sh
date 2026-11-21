#!/usr/bin/env bash
# Phase-1361: honesty milestone 2350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2350
assert "checkpoint 2350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_surface" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1368
print("milestone 2350 ok")
PY
echo "cleaned"
echo "OK: phase1361 e2e passed"
