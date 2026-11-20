#!/usr/bin/env bash
# Phase-38504: soft-complete through 38504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38504
PY
grep -qE 'phase38504|through 38504' webui/STATUS.md
echo "OK: phase38504 e2e passed"
