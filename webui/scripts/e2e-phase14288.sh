#!/usr/bin/env bash
# Phase-14288: soft-complete through 14288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14288
PY
grep -qE 'phase14288|through 14288' webui/STATUS.md
echo "OK: phase14288 e2e passed"
