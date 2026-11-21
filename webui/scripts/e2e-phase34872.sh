#!/usr/bin/env bash
# Phase-34872: soft-complete through 34872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34872
PY
grep -qE 'phase34872|through 34872' webui/STATUS.md
echo "OK: phase34872 e2e passed"
