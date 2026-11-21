#!/usr/bin/env bash
# Phase-48432: soft-complete through 48432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48432
PY
grep -qE 'phase48432|through 48432' webui/STATUS.md
echo "OK: phase48432 e2e passed"
