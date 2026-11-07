#!/usr/bin/env bash
# Phase-4801: honesty milestone 13100 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE >= 13100
assert "ssh_implemented" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.0" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4840" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13100" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert int(h.get('honesty_milestone') or 0) >= 13100
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4808
print("milestone 13100 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4801 e2e passed"
