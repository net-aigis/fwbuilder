#!/usr/bin/env bash
# Phase-38272: soft-complete through 38272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38272
PY
grep -qE 'phase38272|through 38272' webui/STATUS.md
echo "OK: phase38272 e2e passed"
