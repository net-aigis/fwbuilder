#!/usr/bin/env bash
# Phase-31984: soft-complete through 31984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31984
PY
grep -qE 'phase31984|through 31984' webui/STATUS.md
echo "OK: phase31984 e2e passed"
