#!/usr/bin/env bash
# Phase-4577: honesty milestone 12400 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12400
assert "checkpoint 12400" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "4.7" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12400
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4584
print("milestone 12400 ok")
PY
echo "cleaned"
echo "OK: phase4577 e2e passed"
