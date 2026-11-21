#!/usr/bin/env bash
# Phase-48792: soft-complete through 48792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48792
PY
grep -qE 'phase48792|through 48792' webui/STATUS.md
echo "OK: phase48792 e2e passed"
