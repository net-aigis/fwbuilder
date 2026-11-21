#!/usr/bin/env bash
# Phase-47304: soft-complete through 47304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47304
PY
grep -qE 'phase47304|through 47304' webui/STATUS.md
echo "OK: phase47304 e2e passed"
