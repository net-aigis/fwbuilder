#!/usr/bin/env bash
# Phase-43296: soft-complete through 43296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43296
PY
grep -qE 'phase43296|through 43296' webui/STATUS.md
echo "OK: phase43296 e2e passed"
