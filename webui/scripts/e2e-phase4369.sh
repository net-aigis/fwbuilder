#!/usr/bin/env bash
# Phase-4369: honesty milestone 11750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11750
assert "checkpoint 11750" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4360" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11750
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4376
print("milestone 11750 ok")
PY
echo "cleaned"
echo "OK: phase4369 e2e passed"
