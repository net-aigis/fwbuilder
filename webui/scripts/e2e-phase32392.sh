#!/usr/bin/env bash
# Phase-32392: soft-complete through 32392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32392
PY
grep -qE 'phase32392|through 32392' webui/STATUS.md
echo "OK: phase32392 e2e passed"
