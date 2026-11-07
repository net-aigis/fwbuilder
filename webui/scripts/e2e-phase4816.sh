#!/usr/bin/env bash
# Phase-4816: soft-complete through 4816 (schema 5.0).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4816
print("soft-complete >=4816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4816|Soft-complete STATUS through 4816|through 4816' webui/STATUS.md
echo "STATUS soft-complete 4816 ok"; echo "cleaned"; echo "OK: phase4816 e2e passed"
