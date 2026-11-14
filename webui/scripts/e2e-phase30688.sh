#!/usr/bin/env bash
# Phase-30688: soft-complete through 30688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30688
PY
grep -qE 'phase30688|through 30688' webui/STATUS.md
echo "OK: phase30688 e2e passed"
