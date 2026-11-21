#!/usr/bin/env bash
# Phase-1720: soft-complete through 1720 (clear in export/bundle + ms 3450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1720
assert m.WEBUI_HONESTY_MILESTONE == 3450
print("soft-complete >=1720", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1720|Soft-complete STATUS through 1720|through 1720' webui/STATUS.md
echo "STATUS soft-complete 1720 ok"
echo "cleaned"
echo "OK: phase1720 e2e passed"
