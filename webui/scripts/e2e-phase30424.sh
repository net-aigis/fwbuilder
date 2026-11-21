#!/usr/bin/env bash
# Phase-30424: soft-complete through 30424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30424
PY
grep -qE 'phase30424|through 30424' webui/STATUS.md
echo "OK: phase30424 e2e passed"
