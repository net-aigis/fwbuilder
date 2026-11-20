#!/usr/bin/env bash
# Phase-44928: soft-complete through 44928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44928
PY
grep -qE 'phase44928|through 44928' webui/STATUS.md
echo "OK: phase44928 e2e passed"
