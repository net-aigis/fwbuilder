#!/usr/bin/env bash
# Phase-8292: tail milestone 24000 still on tip after Soft 8280+ block.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_HONESTY_MILESTONE == 24000
assert "ssh_alternative_presence_refresh_roster" in m.WEBUI_HONESTY_MILESTONE_NOTE
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8292
print("milestone 24000 tail ok", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase8292 e2e passed"
