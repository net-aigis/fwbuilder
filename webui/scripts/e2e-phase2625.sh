#!/usr/bin/env bash
# Phase-2625: honesty milestone 6300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6300
assert "checkpoint 6300" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2632
print("milestone 6300 ok")
PY
echo "cleaned"
echo "OK: phase2625 e2e passed"
