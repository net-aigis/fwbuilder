#!/usr/bin/env bash
# Phase-2673: honesty milestone 6450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6450
assert "checkpoint 6450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honestyBundleRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2680
print("milestone 6450 ok")
PY
echo "cleaned"
echo "OK: phase2673 e2e passed"
