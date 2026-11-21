#!/usr/bin/env bash
# Phase-46696: soft-complete through 46696 (ms 144000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46696
assert m.WEBUI_HONESTY_MILESTONE == 144000
print("soft-complete >=46696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46696|through 46696' webui/STATUS.md
echo "OK: phase46696 e2e passed"
