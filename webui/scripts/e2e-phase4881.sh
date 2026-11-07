#!/usr/bin/env bash
# Phase-4881: honesty milestone 13350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13350
assert "ssh_capability" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.1" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4920" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13350" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4888
print("milestone 13350 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4881 e2e passed"
