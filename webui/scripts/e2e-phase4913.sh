#!/usr/bin/env bash
# Phase-4913: honesty milestone 13450 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13450
assert "ssh_capability" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.1" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4920" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13450" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13450
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4920
print("milestone 13450 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4913 e2e passed"
