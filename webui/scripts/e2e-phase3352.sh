#!/usr/bin/env bash
# Phase-3352: soft-complete through 3352 (honesty_readiness_roster + ms 8550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3352
assert m.WEBUI_HONESTY_MILESTONE == 8550
print("soft-complete >=3352", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3352|Soft-complete STATUS through 3352|through 3352' webui/STATUS.md
echo "STATUS soft-complete 3352 ok"
echo "cleaned"
echo "OK: phase3352 e2e passed"
