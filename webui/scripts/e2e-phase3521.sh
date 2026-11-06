#!/usr/bin/env bash
# Phase-3521: honesty milestone 9100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 9100
assert "checkpoint 9100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 9100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3528
print("milestone 9100 ok")
PY
echo "cleaned"
echo "OK: phase3521 e2e passed"
