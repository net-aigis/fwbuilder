#!/usr/bin/env bash
# Phase-1409: honesty milestone 2500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2500
assert "checkpoint 2500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_surface" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1416
print("milestone 2500 ok")
PY
echo "cleaned"
echo "OK: phase1409 e2e passed"
