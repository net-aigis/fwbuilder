#!/usr/bin/env bash
# Phase-1281: honesty milestone 2100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 2100
assert "checkpoint 2100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_surface_keys" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 2100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1288
print("milestone 2100 ok")
PY
echo "cleaned"
echo "OK: phase1281 e2e passed"
