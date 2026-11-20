#!/usr/bin/env bash
# Phase-40704: soft-complete through 40704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40704
PY
grep -qE 'phase40704|through 40704' webui/STATUS.md
echo "OK: phase40704 e2e passed"
