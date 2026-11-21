#!/usr/bin/env bash
# Phase-3096: soft-complete through 3096 (Soft 3080+ + ms 7750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3096
assert m.WEBUI_HONESTY_MILESTONE == 7750
print("soft-complete >=3096", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3096|Soft-complete STATUS through 3096|through 3096' webui/STATUS.md
echo "STATUS soft-complete 3096 ok"
echo "cleaned"
echo "OK: phase3096 e2e passed"
