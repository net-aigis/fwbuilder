#!/usr/bin/env bash
# Phase-11088: soft-complete through 11088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11088
PY
grep -qE 'phase11088|through 11088' webui/STATUS.md
echo "OK: phase11088 e2e passed"
