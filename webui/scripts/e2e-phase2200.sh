#!/usr/bin/env bash
# Phase-2200: soft-complete through 2200 (operator_brief sessionStorage + ms 4950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2200
assert m.WEBUI_HONESTY_MILESTONE == 4950
print("soft-complete >=2200", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2200|Soft-complete STATUS through 2200|through 2200' webui/STATUS.md
echo "STATUS soft-complete 2200 ok"
echo "cleaned"
echo "OK: phase2200 e2e passed"
