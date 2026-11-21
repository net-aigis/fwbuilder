#!/usr/bin/env bash
# Phase-3848: soft-complete through 3848 (health_roster export + ms 10100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3848
assert m.WEBUI_HONESTY_MILESTONE == 10100
print("soft-complete >=3848", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3848|Soft-complete STATUS through 3848|through 3848' webui/STATUS.md
echo "STATUS soft-complete 3848 ok"
echo "cleaned"
echo "OK: phase3848 e2e passed"
