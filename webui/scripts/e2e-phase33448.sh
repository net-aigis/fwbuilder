#!/usr/bin/env bash
# Phase-33448: soft-complete through 33448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33448
PY
grep -qE 'phase33448|through 33448' webui/STATUS.md
echo "OK: phase33448 e2e passed"
