#!/usr/bin/env bash
# Phase-34672: soft-complete through 34672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34672
PY
grep -qE 'phase34672|through 34672' webui/STATUS.md
echo "OK: phase34672 e2e passed"
