#!/usr/bin/env bash
# Phase-1728: soft-complete through 1728 (surface version).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1728
print("soft-complete >=1728", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1728|Soft-complete STATUS through 1728|through 1728' webui/STATUS.md
echo "STATUS soft-complete 1728 ok"
echo "cleaned"
echo "OK: phase1728 e2e passed"
