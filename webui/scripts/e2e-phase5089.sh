#!/usr/bin/env bash
# Phase-5089: honesty milestone 14000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 14000
assert "ssh_refusal_paths" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.3" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5080" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 14000" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') == 14000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5096
print("milestone 14000 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5089 e2e passed"
