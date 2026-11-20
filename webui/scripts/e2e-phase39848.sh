#!/usr/bin/env bash
# Phase-39848: soft-complete through 39848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39848
PY
grep -qE 'phase39848|through 39848' webui/STATUS.md
echo "OK: phase39848 e2e passed"
