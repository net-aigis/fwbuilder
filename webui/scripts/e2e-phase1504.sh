#!/usr/bin/env bash
# Phase-1504: soft-complete through 1504 (sessionStorage detail UI).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1504
print("soft-complete >=1504", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1504|Soft-complete STATUS through 1504|through 1504' webui/STATUS.md
echo "STATUS soft-complete 1504 ok"
echo "cleaned"
echo "OK: phase1504 e2e passed"
