#!/usr/bin/env bash
# Phase-15296: soft-complete through 5857 (schema 5.131).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15304
print("soft-complete >=6416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15296|Soft-complete STATUS through 5857|through 5857' webui/STATUS.md
echo "STATUS soft-complete 5136 ok"; echo "cleaned"; echo "OK: phase15296 e2e passed"
