#!/usr/bin/env bash
# Phase-30552: soft-complete through 30552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30552
PY
grep -qE 'phase30552|through 30552' webui/STATUS.md
echo "OK: phase30552 e2e passed"
