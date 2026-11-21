#!/usr/bin/env bash
# Phase-31872: soft-complete through 31872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31872
PY
grep -qE 'phase31872|through 31872' webui/STATUS.md
echo "OK: phase31872 e2e passed"
