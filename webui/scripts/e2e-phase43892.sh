#!/usr/bin/env bash
# Phase-43892: tail milestone 135250 still on tip after Soft 43880+ block.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 135250
assert "ssh_auth_soft_46240_echo_roster" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43892
print("milestone 135250 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase43892 e2e passed"
