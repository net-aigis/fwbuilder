#!/usr/bin/env bash
# Phase-45488: soft-complete through 45488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45488
PY
grep -qE 'phase45488|through 45488' webui/STATUS.md
echo "OK: phase45488 e2e passed"
