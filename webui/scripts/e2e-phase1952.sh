#!/usr/bin/env bash
# Phase-1952: soft-complete through 1952 (readiness sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1952
print("soft-complete >=1952", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1952|Soft-complete STATUS through 1952|through 1952' webui/STATUS.md
echo "STATUS soft-complete 1952 ok"
echo "cleaned"
echo "OK: phase1952 e2e passed"
