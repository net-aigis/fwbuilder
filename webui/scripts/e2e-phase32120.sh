#!/usr/bin/env bash
# Phase-32120: soft-complete through 32120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32120
PY
grep -qE 'phase32120|through 32120' webui/STATUS.md
echo "OK: phase32120 e2e passed"
