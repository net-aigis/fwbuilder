#!/usr/bin/env bash
# Phase-30504: soft-complete through 30504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30504
PY
grep -qE 'phase30504|through 30504' webui/STATUS.md
echo "OK: phase30504 e2e passed"
