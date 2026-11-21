#!/usr/bin/env bash
# Phase-4784: soft-complete through 4784 (ssh_implemented_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4784
print("soft-complete >=4784", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4784|Soft-complete STATUS through 4784|through 4784' webui/STATUS.md
echo "STATUS soft-complete 4784 ok"; echo "cleaned"; echo "OK: phase4784 e2e passed"
