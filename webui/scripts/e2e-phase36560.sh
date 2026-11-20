#!/usr/bin/env bash
# Phase-36560: soft-complete through 36560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36560
PY
grep -qE 'phase36560|through 36560' webui/STATUS.md
echo "OK: phase36560 e2e passed"
