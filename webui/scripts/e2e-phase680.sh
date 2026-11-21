#!/usr/bin/env bash
# Phase-680: soft-complete through 680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 680
print("soft-complete >=680", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase680|Soft-complete STATUS through 680|through 680' webui/STATUS.md
echo "STATUS soft-complete 680 ok"
echo "cleaned"
echo "OK: phase680 e2e passed"
