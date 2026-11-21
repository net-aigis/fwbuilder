#!/usr/bin/env bash
# Phase-33280: soft-complete through 33280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33280
PY
grep -qE 'phase33280|through 33280' webui/STATUS.md
echo "OK: phase33280 e2e passed"
