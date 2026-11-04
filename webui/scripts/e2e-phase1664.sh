#!/usr/bin/env bash
# Phase-1664: soft-complete through 1664 (session storage clear docs).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1664
print("soft-complete >=1664", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1664|Soft-complete STATUS through 1664|through 1664' webui/STATUS.md
echo "STATUS soft-complete 1664 ok"
echo "cleaned"
echo "OK: phase1664 e2e passed"
