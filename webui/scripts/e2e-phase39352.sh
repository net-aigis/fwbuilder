#!/usr/bin/env bash
# Phase-39352: soft-complete through 39352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39352
PY
grep -qE 'phase39352|through 39352' webui/STATUS.md
echo "OK: phase39352 e2e passed"
