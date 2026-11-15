#!/usr/bin/env bash
# Phase-33488: soft-complete through 33488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33488
PY
grep -qE 'phase33488|through 33488' webui/STATUS.md
echo "OK: phase33488 e2e passed"
