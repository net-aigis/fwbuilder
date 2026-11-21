#!/usr/bin/env bash
# Phase-2705: honesty milestone 6550 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6550
assert "checkpoint 6550" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "surface" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6550
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2712
print("milestone 6550 ok")
PY
echo "cleaned"
echo "OK: phase2705 e2e passed"
