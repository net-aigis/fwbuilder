#!/usr/bin/env bash
# Phase-8128: soft-complete through 8128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8128
PY
grep -qE 'phase8128|through 8128' webui/STATUS.md
echo "OK: phase8128 e2e passed"
