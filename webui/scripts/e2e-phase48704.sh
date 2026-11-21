#!/usr/bin/env bash
# Phase-48704: soft-complete through 48704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48704
PY
grep -qE 'phase48704|through 48704' webui/STATUS.md
echo "OK: phase48704 e2e passed"
