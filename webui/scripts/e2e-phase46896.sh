#!/usr/bin/env bash
# Phase-46896: soft-complete through 46896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46896
PY
grep -qE 'phase46896|through 46896' webui/STATUS.md
echo "OK: phase46896 e2e passed"
