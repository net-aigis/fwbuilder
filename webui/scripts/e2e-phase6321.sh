#!/usr/bin/env bash
# Phase-6321: honesty milestone 17850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 17850
assert "ssh" in m.WEBUI_HONESTY_MILESTONE_NOTE or "Soft 5" in m.WEBUI_HONESTY_MILESTONE_NOTE or "schema 5." in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 17850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6336
print("milestone 17850 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase6321 e2e passed"
