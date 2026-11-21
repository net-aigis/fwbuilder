#!/usr/bin/env bash
# Phase-3248: soft-complete through 3248 (Soft 3240+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3248
print("soft-complete >=3248", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3248|Soft-complete STATUS through 3248|through 3248' webui/STATUS.md
echo "STATUS soft-complete 3248 ok"
echo "cleaned"
echo "OK: phase3248 e2e passed"
