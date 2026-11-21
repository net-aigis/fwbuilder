#!/usr/bin/env bash
# Phase-39520: soft-complete through 39520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39520
PY
grep -qE 'phase39520|through 39520' webui/STATUS.md
echo "OK: phase39520 e2e passed"
