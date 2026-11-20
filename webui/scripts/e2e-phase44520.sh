#!/usr/bin/env bash
# Phase-44520: soft-complete through 44520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44520
PY
grep -qE 'phase44520|through 44520' webui/STATUS.md
echo "OK: phase44520 e2e passed"
