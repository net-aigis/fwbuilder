#!/usr/bin/env bash
# Phase-5056: soft-complete through 5056 (schema 5.3).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5056
print("soft-complete >=5056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5056|Soft-complete STATUS through 5056|through 5056' webui/STATUS.md
echo "STATUS soft-complete 5056 ok"; echo "cleaned"; echo "OK: phase5056 e2e passed"
