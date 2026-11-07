#!/usr/bin/env bash
# Phase-4641: honesty milestone 12600 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12600
assert "checkpoint 12600" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "export" in m.WEBUI_HONESTY_MILESTONE_NOTE or "bundle" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12600
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4648
print("milestone 12600 ok")
PY
echo "cleaned"
echo "OK: phase4641 e2e passed"
