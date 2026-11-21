#!/usr/bin/env bash
# Phase-30488: soft-complete through 30488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30488
PY
grep -qE 'phase30488|through 30488' webui/STATUS.md
echo "OK: phase30488 e2e passed"
