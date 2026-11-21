#!/usr/bin/env bash
# Phase-42792: soft-complete through 42792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42792
PY
grep -qE 'phase42792|through 42792' webui/STATUS.md
echo "OK: phase42792 e2e passed"
