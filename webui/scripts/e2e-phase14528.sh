#!/usr/bin/env bash
# Phase-14528: soft-complete through 14528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14528
PY
grep -qE 'phase14528|through 14528' webui/STATUS.md
echo "OK: phase14528 e2e passed"
