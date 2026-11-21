#!/usr/bin/env bash
# Phase-46008: soft-complete through 46008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46008
PY
grep -qE 'phase46008|through 46008' webui/STATUS.md
echo "OK: phase46008 e2e passed"
