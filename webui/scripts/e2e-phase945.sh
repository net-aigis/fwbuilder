#!/usr/bin/env bash
# Phase-945: honesty milestone 1300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1300
assert "checkpoint 1300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "with_size_policy" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 952
print("milestone 1300 ok")
PY
echo "cleaned"
echo "OK: phase945 e2e passed"
