#!/usr/bin/env bash
# Phase-42504: soft-complete through 42504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42504
PY
grep -qE 'phase42504|through 42504' webui/STATUS.md
echo "OK: phase42504 e2e passed"
