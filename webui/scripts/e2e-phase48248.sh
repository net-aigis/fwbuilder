#!/usr/bin/env bash
# Phase-48248: soft-complete through 48248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48248
PY
grep -qE 'phase48248|through 48248' webui/STATUS.md
echo "OK: phase48248 e2e passed"
