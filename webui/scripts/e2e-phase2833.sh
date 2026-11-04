#!/usr/bin/env bash
# Phase-2833: honesty milestone 6950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6950
assert "checkpoint 6950" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "changelogRoster" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2840
print("milestone 6950 ok")
PY
echo "cleaned"
echo "OK: phase2833 e2e passed"
