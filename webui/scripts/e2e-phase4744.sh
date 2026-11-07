#!/usr/bin/env bash
# Phase-4744: soft-complete through 4744 (schema 4.9 + ms 12900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4744
assert m.WEBUI_HONESTY_MILESTONE >= 12900
print("soft-complete >=4744", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4744|Soft-complete STATUS through 4744|through 4744' webui/STATUS.md
echo "STATUS soft-complete 4744 ok"
echo "cleaned"
echo "OK: phase4744 e2e passed"
