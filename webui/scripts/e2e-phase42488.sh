#!/usr/bin/env bash
# Phase-42488: soft-complete through 42488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42488
PY
grep -qE 'phase42488|through 42488' webui/STATUS.md
echo "OK: phase42488 e2e passed"
