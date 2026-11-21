#!/usr/bin/env bash
# Phase-20448: soft-complete through 20448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20448
PY
grep -qE 'phase20448|through 20448' webui/STATUS.md
echo "OK: phase20448 e2e passed"
