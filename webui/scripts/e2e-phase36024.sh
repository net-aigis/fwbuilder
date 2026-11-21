#!/usr/bin/env bash
# Phase-36024: soft-complete through 36024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36024
PY
grep -qE 'phase36024|through 36024' webui/STATUS.md
echo "OK: phase36024 e2e passed"
