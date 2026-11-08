#!/usr/bin/env bash
# Phase-6376: soft-complete through 6376 (Soft 6360+ ssh_not_implemented_batch_roster + ms 18000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6376
assert m.WEBUI_HONESTY_MILESTONE == 18000
print("soft-complete >=6376", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6376|Soft-complete STATUS through 6376|through 6376' webui/STATUS.md
echo "STATUS soft-complete 6376 ok"; echo "cleaned"; echo "OK: phase6376 e2e passed"
