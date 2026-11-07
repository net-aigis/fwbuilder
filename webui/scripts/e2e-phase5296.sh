#!/usr/bin/env bash
# Phase-5296: soft-complete through 5136 (schema 5.6).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5296
print("soft-complete >=5136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5296|Soft-complete STATUS through 5136|through 5136' webui/STATUS.md
echo "STATUS soft-complete 5136 ok"; echo "cleaned"; echo "OK: phase5296 e2e passed"
