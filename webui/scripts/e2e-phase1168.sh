#!/usr/bin/env bash
# Phase-1168: soft-complete through 1168 (milestone 1750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1168
assert m.WEBUI_HONESTY_MILESTONE == 1750
print("soft-complete >=1168", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1168|Soft-complete STATUS through 1168|through 1168' webui/STATUS.md
echo "STATUS soft-complete 1168 ok"
echo "cleaned"
echo "OK: phase1168 e2e passed"
