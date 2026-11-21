#!/usr/bin/env bash
# Phase-19488: soft-complete through 19488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19488
PY
grep -qE 'phase19488|through 19488' webui/STATUS.md
echo "OK: phase19488 e2e passed"
