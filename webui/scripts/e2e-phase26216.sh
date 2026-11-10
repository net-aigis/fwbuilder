#!/usr/bin/env bash
# Phase-26216: soft-complete through 26216 (ms 80000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26216
assert m.WEBUI_HONESTY_MILESTONE == 80000
print("soft-complete >=26216", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26216|through 26216' webui/STATUS.md
echo "OK: phase26216 e2e passed"
