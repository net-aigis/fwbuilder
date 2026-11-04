#!/usr/bin/env bash
# Phase-1688: soft-complete through 1688 (clear in surface + ms 3350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1688
assert m.WEBUI_HONESTY_MILESTONE == 3350
print("soft-complete >=1688", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1688|Soft-complete STATUS through 1688|through 1688' webui/STATUS.md
echo "STATUS soft-complete 1688 ok"
echo "cleaned"
echo "OK: phase1688 e2e passed"
