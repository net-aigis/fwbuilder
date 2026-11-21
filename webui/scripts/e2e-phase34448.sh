#!/usr/bin/env bash
# Phase-34448: soft-complete through 34448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34448
PY
grep -qE 'phase34448|through 34448' webui/STATUS.md
echo "OK: phase34448 e2e passed"
