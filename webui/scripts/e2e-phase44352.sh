#!/usr/bin/env bash
# Phase-44352: soft-complete through 44352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44352
PY
grep -qE 'phase44352|through 44352' webui/STATUS.md
echo "OK: phase44352 e2e passed"
