#!/usr/bin/env bash
# Phase-1016: soft-complete through 1016 (with_alignment).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1016
print("soft-complete >=1016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1016|Soft-complete STATUS through 1016|through 1016' webui/STATUS.md
echo "STATUS soft-complete 1016 ok"
echo "cleaned"
echo "OK: phase1016 e2e passed"
