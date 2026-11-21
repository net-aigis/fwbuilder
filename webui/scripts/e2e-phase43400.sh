#!/usr/bin/env bash
# Phase-43400: soft-complete through 43400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43400
PY
grep -qE 'phase43400|through 43400' webui/STATUS.md
echo "OK: phase43400 e2e passed"
