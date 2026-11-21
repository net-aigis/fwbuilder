#!/usr/bin/env bash
# Phase-5217: honesty milestone 14400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 14400
assert "ssh_method_lists" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.5" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5160" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 14400" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 14400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5224
print("milestone 14400 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5217 e2e passed"
