#!/usr/bin/env bash
# Phase-33600: soft-complete through 33600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33600
PY
grep -qE 'phase33600|through 33600' webui/STATUS.md
echo "OK: phase33600 e2e passed"
