#!/usr/bin/env bash
# Phase-1649: honesty milestone 3250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 3250
assert "checkpoint 3250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "honesty_bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 3250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1656
print("milestone 3250 ok")
PY
echo "cleaned"
echo "OK: phase1649 e2e passed"
