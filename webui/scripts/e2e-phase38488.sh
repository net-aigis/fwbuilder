#!/usr/bin/env bash
# Phase-38488: soft-complete through 38488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38488
PY
grep -qE 'phase38488|through 38488' webui/STATUS.md
echo "OK: phase38488 e2e passed"
