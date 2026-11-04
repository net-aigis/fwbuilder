#!/usr/bin/env bash
# Phase-929: honesty milestone 1250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1250
assert "checkpoint 1250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "truncat" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 936
print("milestone 1250 ok")
PY
echo "cleaned"
echo "OK: phase929 e2e passed"
