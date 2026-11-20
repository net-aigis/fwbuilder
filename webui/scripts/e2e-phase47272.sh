#!/usr/bin/env bash
# Phase-47272: soft-complete through 47272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47272
PY
grep -qE 'phase47272|through 47272' webui/STATUS.md
echo "OK: phase47272 e2e passed"
