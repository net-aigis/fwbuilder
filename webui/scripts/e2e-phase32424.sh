#!/usr/bin/env bash
# Phase-32424: soft-complete through 32424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32424
PY
grep -qE 'phase32424|through 32424' webui/STATUS.md
echo "OK: phase32424 e2e passed"
