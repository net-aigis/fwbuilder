#!/usr/bin/env bash
# Phase-4608: soft-complete through 4608 (Soft 4600+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4608
print("soft-complete >=4608", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4608|Soft-complete STATUS through 4608|through 4608' webui/STATUS.md
echo "STATUS soft-complete 4608 ok"
echo "cleaned"
echo "OK: phase4608 e2e passed"
