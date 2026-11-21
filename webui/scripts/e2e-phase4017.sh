#!/usr/bin/env bash
# Phase-4017: honesty milestone 10650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10650
assert "checkpoint 10650" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.0" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4024
print("milestone 10650 ok")
PY
echo "cleaned"
echo "OK: phase4017 e2e passed"
