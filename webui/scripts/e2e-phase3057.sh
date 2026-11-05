#!/usr/bin/env bash
# Phase-3057: honesty milestone 7650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7650
assert "checkpoint 7650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.8" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3064
print("milestone 7650 ok")
PY
echo "cleaned"
echo "OK: phase3057 e2e passed"
