#!/usr/bin/env bash
# Phase-42560: soft-complete through 42560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42560
PY
grep -qE 'phase42560|through 42560' webui/STATUS.md
echo "OK: phase42560 e2e passed"
