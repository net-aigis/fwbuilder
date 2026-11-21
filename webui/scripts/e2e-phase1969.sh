#!/usr/bin/env bash
# Phase-1969: honesty milestone 4250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4250
assert "checkpoint 4250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "catalogs_complete" in m.WEBUI_HONESTY_MILESTONE_NOTE or "hard_gaps_remain" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1976
print("milestone 4250 ok")
PY
echo "cleaned"
echo "OK: phase1969 e2e passed"
