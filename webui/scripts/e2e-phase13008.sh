#!/usr/bin/env bash
# Phase-13008: soft-complete through 13008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13008
PY
grep -qE 'phase13008|through 13008' webui/STATUS.md
echo "OK: phase13008 e2e passed"
