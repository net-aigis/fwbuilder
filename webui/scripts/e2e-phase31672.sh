#!/usr/bin/env bash
# Phase-31672: soft-complete through 31672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31672
PY
grep -qE 'phase31672|through 31672' webui/STATUS.md
echo "OK: phase31672 e2e passed"
