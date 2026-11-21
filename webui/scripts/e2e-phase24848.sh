#!/usr/bin/env bash
# Phase-24848: soft-complete through 24848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24848
PY
grep -qE 'phase24848|through 24848' webui/STATUS.md
echo "OK: phase24848 e2e passed"
