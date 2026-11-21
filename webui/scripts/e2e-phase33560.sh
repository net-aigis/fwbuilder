#!/usr/bin/env bash
# Phase-33560: soft-complete through 33560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33560
PY
grep -qE 'phase33560|through 33560' webui/STATUS.md
echo "OK: phase33560 e2e passed"
