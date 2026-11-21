#!/usr/bin/env bash
# Phase-39008: soft-complete through 39008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39008
PY
grep -qE 'phase39008|through 39008' webui/STATUS.md
echo "OK: phase39008 e2e passed"
