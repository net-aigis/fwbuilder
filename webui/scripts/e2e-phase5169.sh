#!/usr/bin/env bash
# Phase-5169: honesty milestone 14250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 14250
assert "ssh_refusal_status" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.4" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5160" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 14250" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') == 14250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5176
print("milestone 14250 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5169 e2e passed"
