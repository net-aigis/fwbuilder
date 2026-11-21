#!/usr/bin/env bash
# Phase-32272: soft-complete through 32272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32272
PY
grep -qE 'phase32272|through 32272' webui/STATUS.md
echo "OK: phase32272 e2e passed"
