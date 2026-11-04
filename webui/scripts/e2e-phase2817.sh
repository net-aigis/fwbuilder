#!/usr/bin/env bash
# Phase-2817: honesty milestone 6900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6900
assert "checkpoint 6900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2.5" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2824
print("milestone 6900 ok")
PY
echo "cleaned"
echo "OK: phase2817 e2e passed"
