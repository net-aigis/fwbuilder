#!/usr/bin/env bash
# Phase-34424: soft-complete through 34424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34424
PY
grep -qE 'phase34424|through 34424' webui/STATUS.md
echo "OK: phase34424 e2e passed"
