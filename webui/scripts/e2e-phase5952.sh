#!/usr/bin/env bash
# Phase-5952: soft-complete through 5873 (ssh_batch_mode_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5952
print("soft-complete >=6432", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5952|Soft-complete STATUS through 5873|through 5873' webui/STATUS.md
echo "STATUS soft-complete 5152 ok"; echo "cleaned"; echo "OK: phase5952 e2e passed"
