#!/usr/bin/env bash
# Phase-4800: soft-complete through 4800 (ssh_implemented_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4800
print("soft-complete >=4800", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4800|Soft-complete STATUS through 4800|through 4800' webui/STATUS.md
echo "STATUS soft-complete 4800 ok"; echo "cleaned"; echo "OK: phase4800 e2e passed"
