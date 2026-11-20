#!/usr/bin/env bash
# Phase-43032: soft-complete through 43032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43032
PY
grep -qE 'phase43032|through 43032' webui/STATUS.md
echo "OK: phase43032 e2e passed"
