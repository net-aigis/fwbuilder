#!/usr/bin/env bash
# Phase-2449: honesty milestone 5750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5750
assert "checkpoint 5750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2440" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2456
print("milestone 5750 ok")
PY
echo "cleaned"
echo "OK: phase2449 e2e passed"
