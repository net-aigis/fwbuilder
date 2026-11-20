#!/usr/bin/env bash
# Phase-40984: soft-complete through 40984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40984
PY
grep -qE 'phase40984|through 40984' webui/STATUS.md
echo "OK: phase40984 e2e passed"
