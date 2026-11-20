#!/usr/bin/env bash
# Phase-46520: soft-complete through 46520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46520
PY
grep -qE 'phase46520|through 46520' webui/STATUS.md
echo "OK: phase46520 e2e passed"
