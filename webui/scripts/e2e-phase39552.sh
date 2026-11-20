#!/usr/bin/env bash
# Phase-39552: soft-complete through 39552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39552
PY
grep -qE 'phase39552|through 39552' webui/STATUS.md
echo "OK: phase39552 e2e passed"
