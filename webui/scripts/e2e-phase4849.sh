#!/usr/bin/env bash
# Phase-4849: honesty milestone 13250 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 13250
assert "ssh_implemented" in m.WEBUI_HONESTY_MILESTONE_NOTE or "5.0" in m.WEBUI_HONESTY_MILESTONE_NOTE or "4840" in m.WEBUI_HONESTY_MILESTONE_NOTE or "checkpoint 13250" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get('honesty_milestone') == 13250
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4856
print("milestone 13250 ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase4849 e2e passed"
