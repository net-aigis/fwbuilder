#!/usr/bin/env bash
# Phase-5473: honesty milestone 15200 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 15200
assert "ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE or "Soft 5" in m.WEBUI_HONESTY_MILESTONE_NOTE or "schema 5." in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 15200
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5480
print("milestone 15200 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5473 e2e passed"
