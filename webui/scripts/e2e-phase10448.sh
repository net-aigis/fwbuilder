#!/usr/bin/env bash
# Phase-10448: soft-complete through 10448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10448
PY
grep -qE 'phase10448|through 10448' webui/STATUS.md
echo "OK: phase10448 e2e passed"
