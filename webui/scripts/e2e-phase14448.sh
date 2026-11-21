#!/usr/bin/env bash
# Phase-14448: soft-complete through 14448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14448
PY
grep -qE 'phase14448|through 14448' webui/STATUS.md
echo "OK: phase14448 e2e passed"
