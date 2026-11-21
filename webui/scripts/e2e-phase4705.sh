#!/usr/bin/env bash
# Phase-4705: honesty milestone 12800 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12800
assert "checkpoint 12800" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "ssh_not_implemented" in m.WEBUI_HONESTY_MILESTONE_NOTE or "not-implemented" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12800
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4712
print("milestone 12800 ok")
PY
echo "cleaned"
echo "OK: phase4705 e2e passed"
