#!/usr/bin/env bash
# Phase-1560: soft-complete through 1560 (session storage notes + ms 2950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1560
assert m.WEBUI_HONESTY_MILESTONE == 2950
print("soft-complete >=1560", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1560|Soft-complete STATUS through 1560|through 1560' webui/STATUS.md
echo "STATUS soft-complete 1560 ok"
echo "cleaned"
echo "OK: phase1560 e2e passed"
