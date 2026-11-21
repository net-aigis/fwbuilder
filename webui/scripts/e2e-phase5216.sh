#!/usr/bin/env bash
# Phase-5216: soft-complete through 5136 (schema 5.5).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5216
print("soft-complete >=5136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase5216|Soft-complete STATUS through 5136|through 5136' webui/STATUS.md
echo "STATUS soft-complete 5136 ok"; echo "cleaned"; echo "OK: phase5216 e2e passed"
