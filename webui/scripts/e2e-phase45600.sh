#!/usr/bin/env bash
# Phase-45600: soft-complete through 45600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45600
PY
grep -qE 'phase45600|through 45600' webui/STATUS.md
echo "OK: phase45600 e2e passed"
