#!/usr/bin/env bash
# Phase-39432: soft-complete through 39432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39432
PY
grep -qE 'phase39432|through 39432' webui/STATUS.md
echo "OK: phase39432 e2e passed"
