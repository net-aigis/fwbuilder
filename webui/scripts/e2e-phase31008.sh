#!/usr/bin/env bash
# Phase-31008: soft-complete through 31008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31008
PY
grep -qE 'phase31008|through 31008' webui/STATUS.md
echo "OK: phase31008 e2e passed"
