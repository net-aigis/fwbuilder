#!/usr/bin/env bash
# Phase-5537: honesty milestone 15400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 15400
assert "ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE or "Soft 5" in m.WEBUI_HONESTY_MILESTONE_NOTE or "schema 5." in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 15400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5544
print("milestone 15400 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5537 e2e passed"
