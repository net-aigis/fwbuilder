#!/usr/bin/env bash
# Phase-4769: honesty milestone 13000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 13000
assert "4760" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13000" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4.9" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4760" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') == 13000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4776
print("milestone 13000 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4769 e2e passed"
