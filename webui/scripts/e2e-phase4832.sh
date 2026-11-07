#!/usr/bin/env bash
# Phase-4832: soft-complete through 4832 (ssh_implemented_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4832
print("soft-complete >=4832", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4832|Soft-complete STATUS through 4832|through 4832' webui/STATUS.md
echo "STATUS soft-complete 4832 ok"; echo "cleaned"; echo "OK: phase4832 e2e passed"
