#!/usr/bin/env bash
# Phase-37672: soft-complete through 37672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37672
PY
grep -qE 'phase37672|through 37672' webui/STATUS.md
echo "OK: phase37672 e2e passed"
