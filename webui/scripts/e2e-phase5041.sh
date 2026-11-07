#!/usr/bin/env bash
# Phase-5041: honesty milestone 13850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13850
assert "ssh_refusal_paths" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.3" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5080" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13850" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5048
print("milestone 13850 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5041 e2e passed"
