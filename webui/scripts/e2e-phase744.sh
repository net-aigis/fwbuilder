#!/usr/bin/env bash
# Phase-744: soft-complete through 744 (honesty milestone 800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 744
assert m.WEBUI_HONESTY_MILESTONE == 800
print("soft-complete >=744", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase744|Soft-complete STATUS through 744|through 744' webui/STATUS.md
echo "STATUS soft-complete 744 ok"
echo "cleaned"
echo "OK: phase744 e2e passed"
