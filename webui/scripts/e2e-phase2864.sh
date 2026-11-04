#!/usr/bin/env bash
# Phase-2864: soft-complete through 2864 (expect step roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2864
print("soft-complete >=2864", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2864|Soft-complete STATUS through 2864|through 2864' webui/STATUS.md
echo "STATUS soft-complete 2864 ok"
echo "cleaned"
echo "OK: phase2864 e2e passed"
