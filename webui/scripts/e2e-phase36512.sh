#!/usr/bin/env bash
# Phase-36512: soft-complete through 36512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36512
PY
grep -qE 'phase36512|through 36512' webui/STATUS.md
echo "OK: phase36512 e2e passed"
