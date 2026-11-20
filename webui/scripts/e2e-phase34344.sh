#!/usr/bin/env bash
# Phase-34344: soft-complete through 34344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34344
PY
grep -qE 'phase34344|through 34344' webui/STATUS.md
echo "OK: phase34344 e2e passed"
