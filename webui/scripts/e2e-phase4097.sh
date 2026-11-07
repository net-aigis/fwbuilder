#!/usr/bin/env bash
# Phase-4097: honesty milestone 10900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10900
assert "checkpoint 10900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.1" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4104
print("milestone 10900 ok")
PY
echo "cleaned"
echo "OK: phase4097 e2e passed"
