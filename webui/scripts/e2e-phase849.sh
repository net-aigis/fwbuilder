#!/usr/bin/env bash
# Phase-849: honesty milestone 1000 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1000
assert "checkpoint 1000" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "annotations" in m.WEBUI_HONESTY_MILESTONE_NOTE or "score weights" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1000
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 856
print("milestone 1000 ok")
PY
echo "cleaned"
echo "OK: phase849 e2e passed"
