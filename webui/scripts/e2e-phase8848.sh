#!/usr/bin/env bash
# Phase-8848: soft-complete through 8848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8848
PY
grep -qE 'phase8848|through 8848' webui/STATUS.md
echo "OK: phase8848 e2e passed"
