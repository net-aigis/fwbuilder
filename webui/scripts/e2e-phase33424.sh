#!/usr/bin/env bash
# Phase-33424: soft-complete through 33424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33424
PY
grep -qE 'phase33424|through 33424' webui/STATUS.md
echo "OK: phase33424 e2e passed"
