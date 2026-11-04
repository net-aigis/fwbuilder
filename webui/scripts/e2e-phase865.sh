#!/usr/bin/env bash
# Phase-865: honesty milestone 1050 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1050
assert "checkpoint 1050" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "column_stretch" in m.WEBUI_HONESTY_MILESTONE_NOTE or "size_grip" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1050
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 872
print("milestone 1050 ok")
PY
echo "cleaned"
echo "OK: phase865 e2e passed"
