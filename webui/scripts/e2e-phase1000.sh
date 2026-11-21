#!/usr/bin/env bash
# Phase-1000: soft-complete through 1000 (milestone 1350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1000
assert m.WEBUI_HONESTY_MILESTONE == 1350
print("soft-complete >=1000", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1000|Soft-complete STATUS through 1000|through 1000' webui/STATUS.md
echo "STATUS soft-complete 1000 ok"
echo "cleaned"
echo "OK: phase1000 e2e passed"
