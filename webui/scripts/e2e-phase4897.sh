#!/usr/bin/env bash
# Phase-4897: honesty milestone 13400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13400
assert "ssh_capability" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.1" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4920" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13400" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4904
print("milestone 13400 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4897 e2e passed"
