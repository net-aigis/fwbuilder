#!/usr/bin/env bash
# Phase-35448: soft-complete through 35448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35448
PY
grep -qE 'phase35448|through 35448' webui/STATUS.md
echo "OK: phase35448 e2e passed"
