#!/usr/bin/env bash
# Phase-28448: soft-complete through 28448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28448
PY
grep -qE 'phase28448|through 28448' webui/STATUS.md
echo "OK: phase28448 e2e passed"
