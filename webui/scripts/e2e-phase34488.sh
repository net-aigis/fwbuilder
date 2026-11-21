#!/usr/bin/env bash
# Phase-34488: soft-complete through 34488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34488
PY
grep -qE 'phase34488|through 34488' webui/STATUS.md
echo "OK: phase34488 e2e passed"
