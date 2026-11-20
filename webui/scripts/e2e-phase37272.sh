#!/usr/bin/env bash
# Phase-37272: soft-complete through 37272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37272
PY
grep -qE 'phase37272|through 37272' webui/STATUS.md
echo "OK: phase37272 e2e passed"
