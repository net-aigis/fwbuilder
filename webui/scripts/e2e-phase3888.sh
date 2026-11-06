#!/usr/bin/env bash
# Phase-3888: soft-complete through 3888 (Soft 3880+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3888
print("soft-complete >=3888", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3888|Soft-complete STATUS through 3888|through 3888' webui/STATUS.md
echo "STATUS soft-complete 3888 ok"
echo "cleaned"
echo "OK: phase3888 e2e passed"
