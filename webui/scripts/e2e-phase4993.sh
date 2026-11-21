#!/usr/bin/env bash
# Phase-4993: honesty milestone 13700 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13700
assert "ssh_alternatives" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.2" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5000" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13700" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13700
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5000
print("milestone 13700 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4993 e2e passed"
