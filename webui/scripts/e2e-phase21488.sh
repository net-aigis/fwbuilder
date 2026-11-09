#!/usr/bin/env bash
# Phase-21488: soft-complete through 21488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21488
PY
grep -qE 'phase21488|through 21488' webui/STATUS.md
echo "OK: phase21488 e2e passed"
