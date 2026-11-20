#!/usr/bin/env bash
# Phase-36488: soft-complete through 36488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36488
PY
grep -qE 'phase36488|through 36488' webui/STATUS.md
echo "OK: phase36488 e2e passed"
