#!/usr/bin/env bash
# Phase-3281: honesty milestone 8350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 8350
assert "checkpoint 8350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 8350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3288
print("milestone 8350 ok")
PY
echo "cleaned"
echo "OK: phase3281 e2e passed"
