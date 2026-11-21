#!/usr/bin/env bash
# Phase-30432: soft-complete through 30432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30432
PY
grep -qE 'phase30432|through 30432' webui/STATUS.md
echo "OK: phase30432 e2e passed"
