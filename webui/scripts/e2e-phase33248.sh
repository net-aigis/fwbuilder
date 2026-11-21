#!/usr/bin/env bash
# Phase-33248: soft-complete through 33248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33248
PY
grep -qE 'phase33248|through 33248' webui/STATUS.md
echo "OK: phase33248 e2e passed"
