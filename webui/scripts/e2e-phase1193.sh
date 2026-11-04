#!/usr/bin/env bash
# Phase-1193: honesty milestone 1850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 1850
assert "checkpoint 1850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "ssh_alternative_titles" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 1850
assert isinstance(h.get("ssh_alternative_titles"), dict)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1200
print("milestone 1850 ok")
PY
echo "cleaned"
echo "OK: phase1193 e2e passed"
