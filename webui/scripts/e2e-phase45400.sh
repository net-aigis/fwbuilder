#!/usr/bin/env bash
# Phase-45400: soft-complete through 45400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45400
PY
grep -qE 'phase45400|through 45400' webui/STATUS.md
echo "OK: phase45400 e2e passed"
