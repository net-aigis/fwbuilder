#!/usr/bin/env bash
# Phase-2961: honesty milestone 7350 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7350
assert "checkpoint 7350" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7350
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2968
print("milestone 7350 ok")
PY
echo "cleaned"
echo "OK: phase2961 e2e passed"
