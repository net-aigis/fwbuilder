#!/usr/bin/env bash
# Phase-993: honesty milestone 1350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1350
assert "checkpoint 1350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "signal_key_count" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "with_whats_this" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1000
print("milestone 1350 ok")
PY
echo "cleaned"
echo "OK: phase993 e2e passed"
