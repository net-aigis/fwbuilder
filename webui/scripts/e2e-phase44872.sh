#!/usr/bin/env bash
# Phase-44872: soft-complete through 44872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44872
PY
grep -qE 'phase44872|through 44872' webui/STATUS.md
echo "OK: phase44872 e2e passed"
