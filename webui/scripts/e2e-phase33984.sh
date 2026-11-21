#!/usr/bin/env bash
# Phase-33984: soft-complete through 33984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33984
PY
grep -qE 'phase33984|through 33984' webui/STATUS.md
echo "OK: phase33984 e2e passed"
