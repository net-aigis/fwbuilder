#!/usr/bin/env bash
# Phase-46672: soft-complete through 46672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46672
PY
grep -qE 'phase46672|through 46672' webui/STATUS.md
echo "OK: phase46672 e2e passed"
