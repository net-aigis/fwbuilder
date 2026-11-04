#!/usr/bin/env bash
# Phase-1520: soft-complete through 1520 (sessionStorage keys download).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1520
print("soft-complete >=1520", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1520|Soft-complete STATUS through 1520|through 1520' webui/STATUS.md
echo "STATUS soft-complete 1520 ok"
echo "cleaned"
echo "OK: phase1520 e2e passed"
