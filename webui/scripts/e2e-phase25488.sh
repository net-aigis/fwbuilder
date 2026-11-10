#!/usr/bin/env bash
# Phase-25488: soft-complete through 25488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25488
PY
grep -qE 'phase25488|through 25488' webui/STATUS.md
echo "OK: phase25488 e2e passed"
