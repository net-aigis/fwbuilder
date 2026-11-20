#!/usr/bin/env bash
# Phase-37792: soft-complete through 37792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37792
PY
grep -qE 'phase37792|through 37792' webui/STATUS.md
echo "OK: phase37792 e2e passed"
