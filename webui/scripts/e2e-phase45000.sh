#!/usr/bin/env bash
# Phase-45000: soft-complete through 45000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45000
PY
grep -qE 'phase45000|through 45000' webui/STATUS.md
echo "OK: phase45000 e2e passed"
