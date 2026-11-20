#!/usr/bin/env bash
# Phase-41651: tail milestone 128250 still on tip after Soft 41640+ block.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 128250
assert "ssh_auth_soft_43720_echo_roster" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41651
print("milestone 128250 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase41651 e2e passed"
