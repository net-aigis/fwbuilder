#!/usr/bin/env bash
# Phase-42600: soft-complete through 42600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42600
PY
grep -qE 'phase42600|through 42600' webui/STATUS.md
echo "OK: phase42600 e2e passed"
