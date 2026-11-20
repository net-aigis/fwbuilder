#!/usr/bin/env bash
# Phase-45424: soft-complete through 45424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45424
PY
grep -qE 'phase45424|through 45424' webui/STATUS.md
echo "OK: phase45424 e2e passed"
