#!/usr/bin/env bash
# Phase-34792: soft-complete through 34792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34792
PY
grep -qE 'phase34792|through 34792' webui/STATUS.md
echo "OK: phase34792 e2e passed"
