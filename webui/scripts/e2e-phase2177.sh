#!/usr/bin/env bash
# Phase-2177: honesty milestone 4900 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 4900
assert "checkpoint 4900" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "1.7" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 4900
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2184
print("milestone 4900 ok")
PY
echo "cleaned"
echo "OK: phase2177 e2e passed"
