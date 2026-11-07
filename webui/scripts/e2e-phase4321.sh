#!/usr/bin/env bash
# Phase-4321: honesty milestone 11600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11600
assert "checkpoint 11600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11600
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4328
print("milestone 11600 ok")
PY
echo "cleaned"
echo "OK: phase4321 e2e passed"
