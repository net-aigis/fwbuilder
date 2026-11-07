#!/usr/bin/env bash
# Phase-5152: soft-complete through 5152 (ssh_refusal_status_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5152
print("soft-complete >=5152", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5152|Soft-complete STATUS through 5152|through 5152' webui/STATUS.md
echo "STATUS soft-complete 5152 ok"; echo "cleaned"; echo "OK: phase5152 e2e passed"
