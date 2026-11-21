#!/usr/bin/env bash
# Phase-2577: honesty milestone 6150 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6150
assert "checkpoint 6150" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.2" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6150
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2584
print("milestone 6150 ok")
PY
echo "cleaned"
echo "OK: phase2577 e2e passed"
