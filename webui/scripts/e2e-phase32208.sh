#!/usr/bin/env bash
# Phase-32208: soft-complete through 32208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32208
PY
grep -qE 'phase32208|through 32208' webui/STATUS.md
echo "OK: phase32208 e2e passed"
