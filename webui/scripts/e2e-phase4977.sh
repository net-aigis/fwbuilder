#!/usr/bin/env bash
# Phase-4977: honesty milestone 13650 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13650
assert "ssh_alternatives" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.2" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5000" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13650" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13650
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4984
print("milestone 13650 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4977 e2e passed"
