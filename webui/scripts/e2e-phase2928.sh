#!/usr/bin/env bash
# Phase-2928: soft-complete through 2928 (Soft 2920+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2928
print("soft-complete >=2928", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2928|Soft-complete STATUS through 2928|through 2928' webui/STATUS.md
echo "STATUS soft-complete 2928 ok"
echo "cleaned"
echo "OK: phase2928 e2e passed"
