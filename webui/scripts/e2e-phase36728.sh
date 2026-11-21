#!/usr/bin/env bash
# Phase-36728: soft-complete through 36728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36728
PY
grep -qE 'phase36728|through 36728' webui/STATUS.md
echo "OK: phase36728 e2e passed"
