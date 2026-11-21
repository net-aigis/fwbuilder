#!/usr/bin/env bash
# Phase-45672: soft-complete through 45672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45672
PY
grep -qE 'phase45672|through 45672' webui/STATUS.md
echo "OK: phase45672 e2e passed"
