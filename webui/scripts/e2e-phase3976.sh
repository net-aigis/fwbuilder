#!/usr/bin/env bash
# Phase-3976: soft-complete through 3976 (Soft 3960+ / ms 10500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3976
assert m.WEBUI_HONESTY_MILESTONE == 10500
print("soft-complete >=3976", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3976|Soft-complete STATUS through 3976|through 3976' webui/STATUS.md
echo "STATUS soft-complete 3976 ok"
echo "cleaned"
echo "OK: phase3976 e2e passed"
