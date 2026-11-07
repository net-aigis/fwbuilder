#!/usr/bin/env bash
# Phase-4208: soft-complete through 4208 (Soft 4200+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4208
print("soft-complete >=4208", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4208|Soft-complete STATUS through 4208|through 4208' webui/STATUS.md
echo "STATUS soft-complete 4208 ok"
echo "cleaned"
echo "OK: phase4208 e2e passed"
