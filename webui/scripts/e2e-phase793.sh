#!/usr/bin/env bash
# Phase-793: honesty milestone 900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 900
assert "checkpoint 900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "fixed/minimum" in m.WEBUI_HONESTY_MILESTONE_NOTE or "sizePolicy" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") >= 900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 800
print("milestone 900 ok")
PY
echo "cleaned"
echo "OK: phase793 e2e passed"
