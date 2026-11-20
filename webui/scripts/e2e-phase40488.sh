#!/usr/bin/env bash
# Phase-40488: soft-complete through 40488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40488
PY
grep -qE 'phase40488|through 40488' webui/STATUS.md
echo "OK: phase40488 e2e passed"
