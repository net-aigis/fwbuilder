#!/usr/bin/env bash
# Phase-4081: honesty milestone 10850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 10850
assert "checkpoint 10850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 10850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4088
print("milestone 10850 ok")
PY
echo "cleaned"
echo "OK: phase4081 e2e passed"
