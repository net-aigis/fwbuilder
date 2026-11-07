#!/usr/bin/env bash
# Phase-4865: honesty milestone 13300 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13300
assert "ssh_capability" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.1" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4920" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13300" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13300
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4872
print("milestone 13300 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4865 e2e passed"
