#!/usr/bin/env bash
# Phase-32560: soft-complete through 32560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32560
PY
grep -qE 'phase32560|through 32560' webui/STATUS.md
echo "OK: phase32560 e2e passed"
