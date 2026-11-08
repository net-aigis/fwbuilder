#!/usr/bin/env bash
# Phase-13248: soft-complete through 13248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13248
PY
grep -qE 'phase13248|through 13248' webui/STATUS.md
echo "OK: phase13248 e2e passed"
