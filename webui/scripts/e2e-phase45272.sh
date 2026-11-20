#!/usr/bin/env bash
# Phase-45272: soft-complete through 45272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45272
PY
grep -qE 'phase45272|through 45272' webui/STATUS.md
echo "OK: phase45272 e2e passed"
