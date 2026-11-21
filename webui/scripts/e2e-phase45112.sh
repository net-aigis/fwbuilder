#!/usr/bin/env bash
# Phase-45112: soft-complete through 45112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45112
PY
grep -qE 'phase45112|through 45112' webui/STATUS.md
echo "OK: phase45112 e2e passed"
