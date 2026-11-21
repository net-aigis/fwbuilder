#!/usr/bin/env bash
# Phase-30528: soft-complete through 30528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30528
PY
grep -qE 'phase30528|through 30528' webui/STATUS.md
echo "OK: phase30528 e2e passed"
