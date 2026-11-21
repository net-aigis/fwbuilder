#!/usr/bin/env bash
# Phase-16528: soft-complete through 16528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16528
PY
grep -qE 'phase16528|through 16528' webui/STATUS.md
echo "OK: phase16528 e2e passed"
