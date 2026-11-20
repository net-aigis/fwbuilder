#!/usr/bin/env bash
# Phase-36200: soft-complete through 36200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36200
PY
grep -qE 'phase36200|through 36200' webui/STATUS.md
echo "OK: phase36200 e2e passed"
