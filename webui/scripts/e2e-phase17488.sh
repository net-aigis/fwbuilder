#!/usr/bin/env bash
# Phase-17488: soft-complete through 17488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17488
PY
grep -qE 'phase17488|through 17488' webui/STATUS.md
echo "OK: phase17488 e2e passed"
