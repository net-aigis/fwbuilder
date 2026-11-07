#!/usr/bin/env bash
# Phase-4401: honesty milestone 11850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 11850
assert "checkpoint 11850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 11850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4408
print("milestone 11850 ok")
PY
echo "cleaned"
echo "OK: phase4401 e2e passed"
