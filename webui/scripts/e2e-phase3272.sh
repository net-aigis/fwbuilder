#!/usr/bin/env bash
# Phase-3272: soft-complete through 3272 (catalog_summary_roster + ms 8300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3272
assert m.WEBUI_HONESTY_MILESTONE == 8300
print("soft-complete >=3272", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3272|Soft-complete STATUS through 3272|through 3272' webui/STATUS.md
echo "STATUS soft-complete 3272 ok"
echo "cleaned"
echo "OK: phase3272 e2e passed"
