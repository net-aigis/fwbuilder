#!/usr/bin/env bash
# Phase-1729: honesty milestone 3500 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3500
assert "checkpoint 3500" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "soft_fertig_honesty_surface_version" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3500
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1736
print("milestone 3500 ok")
PY
echo "cleaned"
echo "OK: phase1729 e2e passed"
