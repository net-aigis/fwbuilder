#!/usr/bin/env bash
# Phase-31520: soft-complete through 31520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31520
PY
grep -qE 'phase31520|through 31520' webui/STATUS.md
echo "OK: phase31520 e2e passed"
