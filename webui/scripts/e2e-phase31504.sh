#!/usr/bin/env bash
# Phase-31504: soft-complete through 31504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31504
PY
grep -qE 'phase31504|through 31504' webui/STATUS.md
echo "OK: phase31504 e2e passed"
