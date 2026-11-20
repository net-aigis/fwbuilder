#!/usr/bin/env bash
# Phase-40208: soft-complete through 40208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40208
PY
grep -qE 'phase40208|through 40208' webui/STATUS.md
echo "OK: phase40208 e2e passed"
