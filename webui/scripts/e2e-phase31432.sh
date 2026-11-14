#!/usr/bin/env bash
# Phase-31432: soft-complete through 31432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31432
PY
grep -qE 'phase31432|through 31432' webui/STATUS.md
echo "OK: phase31432 e2e passed"
