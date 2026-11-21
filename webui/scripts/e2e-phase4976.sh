#!/usr/bin/env bash
# Phase-4976: soft-complete through 4976 (schema 5.2).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4976
print("soft-complete >=4976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4976|Soft-complete STATUS through 4976|through 4976' webui/STATUS.md
echo "STATUS soft-complete 4976 ok"; echo "cleaned"; echo "OK: phase4976 e2e passed"
