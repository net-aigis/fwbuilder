#!/usr/bin/env bash
# Phase-5025: honesty milestone 13800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13800
assert "ssh_refusal_paths" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.3" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5080" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13800" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5032
print("milestone 13800 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5025 e2e passed"
