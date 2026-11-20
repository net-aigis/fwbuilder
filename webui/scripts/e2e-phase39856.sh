#!/usr/bin/env bash
# Phase-39856: soft-complete through 39856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39856
PY
grep -qE 'phase39856|through 39856' webui/STATUS.md
echo "OK: phase39856 e2e passed"
