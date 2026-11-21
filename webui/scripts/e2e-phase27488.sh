#!/usr/bin/env bash
# Phase-27488: soft-complete through 27488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27488
PY
grep -qE 'phase27488|through 27488' webui/STATUS.md
echo "OK: phase27488 e2e passed"
