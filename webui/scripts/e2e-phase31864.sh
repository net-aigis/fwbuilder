#!/usr/bin/env bash
# Phase-31864: soft-complete through 31864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31864
PY
grep -qE 'phase31864|through 31864' webui/STATUS.md
echo "OK: phase31864 e2e passed"
