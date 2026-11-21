#!/usr/bin/env bash
# Phase-713: honesty milestone 750 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 750
assert "checkpoint" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "sizeType" in m.WEBUI_HONESTY_MILESTONE_NOTE or "size_type" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == m.WEBUI_HONESTY_MILESTONE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 720
print("milestone 750 ok")
PY
echo "cleaned"
echo "OK: phase713 e2e passed"
