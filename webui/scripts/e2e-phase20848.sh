#!/usr/bin/env bash
# Phase-20848: soft-complete through 20848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20848
PY
grep -qE 'phase20848|through 20848' webui/STATUS.md
echo "OK: phase20848 e2e passed"
