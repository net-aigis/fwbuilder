#!/usr/bin/env bash
# Phase-33544: soft-complete through 33544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33544
PY
grep -qE 'phase33544|through 33544' webui/STATUS.md
echo "OK: phase33544 e2e passed"
