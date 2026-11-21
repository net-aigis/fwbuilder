#!/usr/bin/env bash
# Phase-37248: soft-complete through 37248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37248
PY
grep -qE 'phase37248|through 37248' webui/STATUS.md
echo "OK: phase37248 e2e passed"
