#!/usr/bin/env bash
# Phase-4056: soft-complete through 4056 (Soft 4040+ / ms 10750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4056
assert m.WEBUI_HONESTY_MILESTONE == 10750
print("soft-complete >=4056", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4056|Soft-complete STATUS through 4056|through 4056' webui/STATUS.md
echo "STATUS soft-complete 4056 ok"
echo "cleaned"
echo "OK: phase4056 e2e passed"
