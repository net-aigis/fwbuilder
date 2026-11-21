#!/usr/bin/env bash
# Phase-2609: honesty milestone 6250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6250
assert "checkpoint 6250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "2600" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2616
print("milestone 6250 ok")
PY
echo "cleaned"
echo "OK: phase2609 e2e passed"
