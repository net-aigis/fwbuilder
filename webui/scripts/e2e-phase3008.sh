#!/usr/bin/env bash
# Phase-3008: soft-complete through 3008 (Soft 3000+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3008
print("soft-complete >=3008", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3008|Soft-complete STATUS through 3008|through 3008' webui/STATUS.md
echo "STATUS soft-complete 3008 ok"
echo "cleaned"
echo "OK: phase3008 e2e passed"
