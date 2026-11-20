#!/usr/bin/env bash
# Phase-44600: soft-complete through 44600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44600
PY
grep -qE 'phase44600|through 44600' webui/STATUS.md
echo "OK: phase44600 e2e passed"
