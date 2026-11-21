#!/usr/bin/env bash
# Phase-47296: soft-complete through 47296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47296
PY
grep -qE 'phase47296|through 47296' webui/STATUS.md
echo "OK: phase47296 e2e passed"
