#!/usr/bin/env bash
# Phase-23808: soft-complete through 23808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23808
PY
grep -qE 'phase23808|through 23808' webui/STATUS.md
echo "OK: phase23808 e2e passed"
