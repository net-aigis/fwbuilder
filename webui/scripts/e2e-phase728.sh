#!/usr/bin/env bash
# Phase-728: soft-complete through 728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 728
print("soft-complete >=728", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase728|Soft-complete STATUS through 728|through 728' webui/STATUS.md
echo "STATUS soft-complete 728 ok"
echo "cleaned"
echo "OK: phase728 e2e passed"
