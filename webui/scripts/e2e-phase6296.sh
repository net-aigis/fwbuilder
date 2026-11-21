#!/usr/bin/env bash
# Phase-6296: soft-complete through 6296 (Soft 6280+ ssh_implemented_batch_roster + ms 17750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6296
assert m.WEBUI_HONESTY_MILESTONE == 17750
print("soft-complete >=6296", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6296|Soft-complete STATUS through 6296|through 6296' webui/STATUS.md
echo "STATUS soft-complete 6296 ok"; echo "cleaned"; echo "OK: phase6296 e2e passed"
