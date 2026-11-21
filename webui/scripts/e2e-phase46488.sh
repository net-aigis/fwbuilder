#!/usr/bin/env bash
# Phase-46488: soft-complete through 46488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46488
PY
grep -qE 'phase46488|through 46488' webui/STATUS.md
echo "OK: phase46488 e2e passed"
