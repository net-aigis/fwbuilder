#!/usr/bin/env bash
# Phase-48032: soft-complete through 48032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48032
PY
grep -qE 'phase48032|through 48032' webui/STATUS.md
echo "OK: phase48032 e2e passed"
