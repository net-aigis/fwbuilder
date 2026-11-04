#!/usr/bin/env bash
# Phase-825: honesty milestone 950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 950
assert "checkpoint 950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "preferred" in m.WEBUI_HONESTY_MILESTONE_NOTE or "stacked_sections" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 832
print("milestone 950 ok")
PY
echo "cleaned"
echo "OK: phase825 e2e passed"
