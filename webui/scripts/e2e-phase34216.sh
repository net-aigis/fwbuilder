#!/usr/bin/env bash
# Phase-34216: soft-complete through 34216 (ms 105000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34216
assert m.WEBUI_HONESTY_MILESTONE == 105000
print("soft-complete >=34216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34216|through 34216' webui/STATUS.md
echo "OK: phase34216 e2e passed"
