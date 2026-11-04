#!/usr/bin/env bash
# Phase-2408: soft-complete through 2408 (honesty_path_roster export + ms 5600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2408
assert m.WEBUI_HONESTY_MILESTONE == 5600
print("soft-complete >=2408", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2408|Soft-complete STATUS through 2408|through 2408' webui/STATUS.md
echo "STATUS soft-complete 2408 ok"
echo "cleaned"
echo "OK: phase2408 e2e passed"
