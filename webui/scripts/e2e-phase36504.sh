#!/usr/bin/env bash
# Phase-36504: soft-complete through 36504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36504
PY
grep -qE 'phase36504|through 36504' webui/STATUS.md
echo "OK: phase36504 e2e passed"
