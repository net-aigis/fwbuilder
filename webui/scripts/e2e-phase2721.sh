#!/usr/bin/env bash
# Phase-2721: honesty milestone 6600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 6600
assert "checkpoint 6600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 6600
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2728
print("milestone 6600 ok")
PY
echo "cleaned"
echo "OK: phase2721 e2e passed"
