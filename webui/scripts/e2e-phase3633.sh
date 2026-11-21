#!/usr/bin/env bash
# Phase-3633: honesty milestone 9450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9450
assert "checkpoint 9450" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "surfaceChangelogMetaRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3640
print("milestone 9450 ok")
PY
echo "cleaned"
echo "OK: phase3633 e2e passed"
