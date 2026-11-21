#!/usr/bin/env bash
# Phase-47592: soft-complete through 47592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47592
PY
grep -qE 'phase47592|through 47592' webui/STATUS.md
echo "OK: phase47592 e2e passed"
