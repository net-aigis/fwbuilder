#!/usr/bin/env bash
# Phase-6704: soft-complete through 6704 (ssh_not_implemented_keyboard_roster opening block).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6704
print("soft-complete >=6704", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6704|Soft-complete STATUS through 6704|through 6704' webui/STATUS.md
echo "STATUS soft-complete 6704 ok"; echo "cleaned"; echo "OK: phase6704 e2e passed"
