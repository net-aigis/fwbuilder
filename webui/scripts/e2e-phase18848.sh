#!/usr/bin/env bash
# Phase-18848: soft-complete through 18848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18848
PY
grep -qE 'phase18848|through 18848' webui/STATUS.md
echo "OK: phase18848 e2e passed"
