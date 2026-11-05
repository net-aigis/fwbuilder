#!/usr/bin/env bash
# Phase-3121: honesty milestone 7850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 7850
assert "checkpoint 7850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower() or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE.lower()
h = m.hard_gaps()
assert h.get("honesty_milestone") == 7850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3128
print("milestone 7850 ok")
PY
echo "cleaned"
echo "OK: phase3121 e2e passed"
