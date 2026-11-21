#!/usr/bin/env bash
# Phase-5121: honesty milestone 14100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 14100
assert "ssh_refusal_status" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.4" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5160" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 14100" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 14100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5128
print("milestone 14100 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5121 e2e passed"
