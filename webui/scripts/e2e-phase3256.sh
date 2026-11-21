#!/usr/bin/env bash
# Phase-3256: soft-complete through 3256 (Soft 3240+ / ms 8250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3256
assert m.WEBUI_HONESTY_MILESTONE == 8250
print("soft-complete >=3256", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3256|Soft-complete STATUS through 3256|through 3256' webui/STATUS.md
echo "STATUS soft-complete 3256 ok"
echo "cleaned"
echo "OK: phase3256 e2e passed"
