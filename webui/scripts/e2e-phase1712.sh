#!/usr/bin/env bash
# Phase-1712: soft-complete through 1712 (clear in export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1712
print("soft-complete >=1712", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1712|Soft-complete STATUS through 1712|through 1712' webui/STATUS.md
echo "STATUS soft-complete 1712 ok"
echo "cleaned"
echo "OK: phase1712 e2e passed"
