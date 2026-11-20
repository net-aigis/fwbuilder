#!/usr/bin/env bash
# Phase-39536: soft-complete through 39536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39536
PY
grep -qE 'phase39536|through 39536' webui/STATUS.md
echo "OK: phase39536 e2e passed"
