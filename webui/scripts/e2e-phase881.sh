#!/usr/bin/env bash
# Phase-881: honesty milestone 1100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1100
assert "checkpoint 1100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "with_grid" in m.WEBUI_HONESTY_MILESTONE_NOTE or "fields" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 888
print("milestone 1100 ok")
PY
echo "cleaned"
echo "OK: phase881 e2e passed"
