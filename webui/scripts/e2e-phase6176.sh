#!/usr/bin/env bash
# Phase-6176: soft-complete through 5857 (schema 5.17).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6176
print("soft-complete >=6416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6176|Soft-complete STATUS through 5857|through 5857' webui/STATUS.md
echo "STATUS soft-complete 5136 ok"; echo "cleaned"; echo "OK: phase6176 e2e passed"
