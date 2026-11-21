#!/usr/bin/env bash
# Phase-4209: honesty milestone 11250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11250
assert "checkpoint 11250" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4200" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4216
print("milestone 11250 ok")
PY
echo "cleaned"
echo "OK: phase4209 e2e passed"
