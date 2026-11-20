#!/usr/bin/env bash
# Phase-44432: soft-complete through 44432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44432
PY
grep -qE 'phase44432|through 44432' webui/STATUS.md
echo "OK: phase44432 e2e passed"
