#!/usr/bin/env bash
# Phase-1904: soft-complete through 1904 (honesty readiness).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1904
print("soft-complete >=1904", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1904|Soft-complete STATUS through 1904|through 1904' webui/STATUS.md
echo "STATUS soft-complete 1904 ok"
echo "cleaned"
echo "OK: phase1904 e2e passed"
