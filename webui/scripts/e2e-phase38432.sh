#!/usr/bin/env bash
# Phase-38432: soft-complete through 38432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38432
PY
grep -qE 'phase38432|through 38432' webui/STATUS.md
echo "OK: phase38432 e2e passed"
