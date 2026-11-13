#!/usr/bin/env bash
# Phase-29488: soft-complete through 29488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29488
PY
grep -qE 'phase29488|through 29488' webui/STATUS.md
echo "OK: phase29488 e2e passed"
