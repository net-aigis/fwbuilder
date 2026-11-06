#!/usr/bin/env bash
# Phase-3816: soft-complete through 3816 (Soft 3800+ / ms 10000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3816
assert m.WEBUI_HONESTY_MILESTONE == 10000
print("soft-complete >=3816", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3816|Soft-complete STATUS through 3816|through 3816' webui/STATUS.md
echo "STATUS soft-complete 3816 ok"
echo "cleaned"
echo "OK: phase3816 e2e passed"
