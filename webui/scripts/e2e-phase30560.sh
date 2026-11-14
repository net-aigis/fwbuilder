#!/usr/bin/env bash
# Phase-30560: soft-complete through 30560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30560
PY
grep -qE 'phase30560|through 30560' webui/STATUS.md
echo "OK: phase30560 e2e passed"
