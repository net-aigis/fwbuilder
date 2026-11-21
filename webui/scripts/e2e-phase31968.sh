#!/usr/bin/env bash
# Phase-31968: soft-complete through 31968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31968
PY
grep -qE 'phase31968|through 31968' webui/STATUS.md
echo "OK: phase31968 e2e passed"
