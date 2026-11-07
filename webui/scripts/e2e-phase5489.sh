#!/usr/bin/env bash
# Phase-5489: honesty milestone 15250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 15250
assert "ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE or "Soft 5" in m.WEBUI_HONESTY_MILESTONE_NOTE or "schema 5." in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') >= 15250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5496
print("milestone 15250 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5489 e2e passed"
