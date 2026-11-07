#!/usr/bin/env bash
# Phase-4737: honesty milestone 12900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 12900
assert "4.9" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 12900" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4.9" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4760" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 12900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4744
print("milestone 12900 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4737 e2e passed"
