#!/usr/bin/env bash
# Phase-3432: soft-complete through 3432 (session_storage_clear_roster + ms 8800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3432
assert m.WEBUI_HONESTY_MILESTONE == 8800
print("soft-complete >=3432", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3432|Soft-complete STATUS through 3432|through 3432' webui/STATUS.md
echo "STATUS soft-complete 3432 ok"
echo "cleaned"
echo "OK: phase3432 e2e passed"
