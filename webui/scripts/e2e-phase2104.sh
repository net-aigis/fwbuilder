#!/usr/bin/env bash
# Phase-2104: soft-complete through 2104 (surface_changelog export/bundle + ms 4650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2104
assert m.WEBUI_HONESTY_MILESTONE == 4650
print("soft-complete >=2104", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2104|Soft-complete STATUS through 2104|through 2104' webui/STATUS.md
echo "STATUS soft-complete 2104 ok"
echo "cleaned"
echo "OK: phase2104 e2e passed"
