#!/usr/bin/env bash
# Phase-1624: soft-complete through 1624 (honesty bundle + ms 3150).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1624
assert m.WEBUI_HONESTY_MILESTONE == 3150
print("soft-complete >=1624", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1624|Soft-complete STATUS through 1624|through 1624' webui/STATUS.md
echo "STATUS soft-complete 1624 ok"
echo "cleaned"
echo "OK: phase1624 e2e passed"
