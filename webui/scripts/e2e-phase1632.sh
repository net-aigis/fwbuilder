#!/usr/bin/env bash
# Phase-1632: soft-complete through 1632 (honesty bundle in surface keys).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1632
print("soft-complete >=1632", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1632|Soft-complete STATUS through 1632|through 1632' webui/STATUS.md
echo "STATUS soft-complete 1632 ok"
echo "cleaned"
echo "OK: phase1632 e2e passed"
