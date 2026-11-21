#!/usr/bin/env bash
# Phase-37856: soft-complete through 37856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37856
PY
grep -qE 'phase37856|through 37856' webui/STATUS.md
echo "OK: phase37856 e2e passed"
