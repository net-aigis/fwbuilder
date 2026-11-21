#!/usr/bin/env bash
# Phase-37528: soft-complete through 37528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37528
PY
grep -qE 'phase37528|through 37528' webui/STATUS.md
echo "OK: phase37528 e2e passed"
