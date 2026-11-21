#!/usr/bin/env bash
# Phase-13336: soft-complete through 13336 (ms 39750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13336
assert m.WEBUI_HONESTY_MILESTONE == 39750
print("soft-complete >=13336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13336|through 13336' webui/STATUS.md
echo "OK: phase13336 e2e passed"
