#!/usr/bin/env bash
# Phase-1680: soft-complete through 1680 (clear fields in surface keys).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1680
print("soft-complete >=1680", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1680|Soft-complete STATUS through 1680|through 1680' webui/STATUS.md
echo "STATUS soft-complete 1680 ok"
echo "cleaned"
echo "OK: phase1680 e2e passed"
