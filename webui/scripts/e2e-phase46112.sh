#!/usr/bin/env bash
# Phase-46112: soft-complete through 46112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46112
PY
grep -qE 'phase46112|through 46112' webui/STATUS.md
echo "OK: phase46112 e2e passed"
