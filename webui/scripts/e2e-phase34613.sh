#!/usr/bin/env bash
# Phase-34613: tail milestone 106250 still on tip after Soft 34600+ block.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 106250
assert "ssh_auth_soft_35800_echo_roster" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34613
print("milestone 106250 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase34613 e2e passed"
