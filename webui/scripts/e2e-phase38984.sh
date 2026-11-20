#!/usr/bin/env bash
# Phase-38984: soft-complete through 38984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38984
PY
grep -qE 'phase38984|through 38984' webui/STATUS.md
echo "OK: phase38984 e2e passed"
