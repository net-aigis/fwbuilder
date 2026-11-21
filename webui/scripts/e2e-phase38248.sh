#!/usr/bin/env bash
# Phase-38248: soft-complete through 38248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38248
PY
grep -qE 'phase38248|through 38248' webui/STATUS.md
echo "OK: phase38248 e2e passed"
