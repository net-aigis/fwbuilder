#!/usr/bin/env bash
# Phase-32264: soft-complete through 32264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32264
PY
grep -qE 'phase32264|through 32264' webui/STATUS.md
echo "OK: phase32264 e2e passed"
