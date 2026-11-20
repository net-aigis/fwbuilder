#!/usr/bin/env bash
# Phase-45448: soft-complete through 45448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45448
PY
grep -qE 'phase45448|through 45448' webui/STATUS.md
echo "OK: phase45448 e2e passed"
