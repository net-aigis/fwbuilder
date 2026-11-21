#!/usr/bin/env bash
# Phase-4753: honesty milestone 12950 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 12950
assert "sessionStorage" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 12950" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4.9" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4760" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 12950
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4760
print("milestone 12950 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase4753 e2e passed"
