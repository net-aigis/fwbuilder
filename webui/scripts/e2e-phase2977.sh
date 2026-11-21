#!/usr/bin/env bash
# Phase-2977: honesty milestone 7400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7400
assert "checkpoint 7400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.7" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2984
print("milestone 7400 ok")
PY
echo "cleaned"
echo "OK: phase2977 e2e passed"
