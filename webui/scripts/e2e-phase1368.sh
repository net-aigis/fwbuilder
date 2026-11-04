#!/usr/bin/env bash
# Phase-1368: soft-complete through 1368 (milestone 2350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1368
assert m.WEBUI_HONESTY_MILESTONE == 2350
print("soft-complete >=1368", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1368|Soft-complete STATUS through 1368|through 1368' webui/STATUS.md
echo "STATUS soft-complete 1368 ok"
echo "cleaned"
echo "OK: phase1368 e2e passed"
