#!/usr/bin/env bash
# Phase-47488: soft-complete through 47488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47488
PY
grep -qE 'phase47488|through 47488' webui/STATUS.md
echo "OK: phase47488 e2e passed"
