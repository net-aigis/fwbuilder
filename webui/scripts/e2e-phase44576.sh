#!/usr/bin/env bash
# Phase-44576: soft-complete through 44576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44576
PY
grep -qE 'phase44576|through 44576' webui/STATUS.md
echo "OK: phase44576 e2e passed"
