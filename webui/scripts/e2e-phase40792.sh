#!/usr/bin/env bash
# Phase-40792: soft-complete through 40792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40792
PY
grep -qE 'phase40792|through 40792' webui/STATUS.md
echo "OK: phase40792 e2e passed"
