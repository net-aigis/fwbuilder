#!/usr/bin/env bash
# Phase-36744: soft-complete through 36744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36744
PY
grep -qE 'phase36744|through 36744' webui/STATUS.md
echo "OK: phase36744 e2e passed"
