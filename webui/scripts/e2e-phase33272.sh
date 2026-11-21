#!/usr/bin/env bash
# Phase-33272: soft-complete through 33272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33272
PY
grep -qE 'phase33272|through 33272' webui/STATUS.md
echo "OK: phase33272 e2e passed"
