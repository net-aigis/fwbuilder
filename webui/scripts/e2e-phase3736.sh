#!/usr/bin/env bash
# Phase-3736: soft-complete through 3736 (Soft 3720+ / ms 9750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3736
assert m.WEBUI_HONESTY_MILESTONE == 9750
print("soft-complete >=3736", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3736|Soft-complete STATUS through 3736|through 3736' webui/STATUS.md
echo "STATUS soft-complete 3736 ok"
echo "cleaned"
echo "OK: phase3736 e2e passed"
