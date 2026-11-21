#!/usr/bin/env bash
# Phase-2305: honesty milestone 5300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 5300
assert "checkpoint 5300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "refusal" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 5300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2312
print("milestone 5300 ok")
PY
echo "cleaned"
echo "OK: phase2305 e2e passed"
