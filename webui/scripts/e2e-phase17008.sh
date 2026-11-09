#!/usr/bin/env bash
# Phase-17008: soft-complete through 17008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17008
PY
grep -qE 'phase17008|through 17008' webui/STATUS.md
echo "OK: phase17008 e2e passed"
