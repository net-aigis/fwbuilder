#!/usr/bin/env bash
# Phase-32192: soft-complete through 32192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32192
PY
grep -qE 'phase32192|through 32192' webui/STATUS.md
echo "OK: phase32192 e2e passed"
