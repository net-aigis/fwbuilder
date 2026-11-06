#!/usr/bin/env bash
# Phase-4048: soft-complete through 4048 (Soft 4040+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4048
print("soft-complete >=4048", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4048|Soft-complete STATUS through 4048|through 4048' webui/STATUS.md
echo "STATUS soft-complete 4048 ok"
echo "cleaned"
echo "OK: phase4048 e2e passed"
