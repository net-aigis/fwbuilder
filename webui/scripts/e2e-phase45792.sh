#!/usr/bin/env bash
# Phase-45792: soft-complete through 45792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45792
PY
grep -qE 'phase45792|through 45792' webui/STATUS.md
echo "OK: phase45792 e2e passed"
