#!/usr/bin/env bash
# Phase-4481: honesty milestone 12100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12100
assert "checkpoint 12100" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4488
print("milestone 12100 ok")
PY
echo "cleaned"
echo "OK: phase4481 e2e passed"
