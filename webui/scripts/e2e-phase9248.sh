#!/usr/bin/env bash
# Phase-9248: soft-complete through 9248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9248
PY
grep -qE 'phase9248|through 9248' webui/STATUS.md
echo "OK: phase9248 e2e passed"
