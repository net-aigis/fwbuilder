#!/usr/bin/env bash
# Phase-4721: honesty milestone 12850 + note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 12850
assert "checkpoint 12850" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert "ssh_not_implemented" in m.WEBUI_HONESTY_MILESTONE_NOTE or "export" in m.WEBUI_HONESTY_MILESTONE_NOTE
h = m.hard_gaps()
assert h.get("honesty_milestone") == 12850
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4728
print("milestone 12850 ok")
PY
echo "cleaned"
echo "OK: phase4721 e2e passed"
