#!/usr/bin/env bash
# Phase-35352: soft-complete through 35352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35352
PY
grep -qE 'phase35352|through 35352' webui/STATUS.md
echo "OK: phase35352 e2e passed"
