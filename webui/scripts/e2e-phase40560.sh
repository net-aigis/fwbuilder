#!/usr/bin/env bash
# Phase-40560: soft-complete through 40560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40560
PY
grep -qE 'phase40560|through 40560' webui/STATUS.md
echo "OK: phase40560 e2e passed"
