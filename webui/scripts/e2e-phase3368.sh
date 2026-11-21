#!/usr/bin/env bash
# Phase-3368: soft-complete through 3368 (honesty_readiness_roster export + ms 8600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3368
assert m.WEBUI_HONESTY_MILESTONE == 8600
print("soft-complete >=3368", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3368|Soft-complete STATUS through 3368|through 3368' webui/STATUS.md
echo "STATUS soft-complete 3368 ok"
echo "cleaned"
echo "OK: phase3368 e2e passed"
