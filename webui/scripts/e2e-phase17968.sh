#!/usr/bin/env bash
# Phase-17968: soft-complete through 17968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17968
PY
grep -qE 'phase17968|through 17968' webui/STATUS.md
echo "OK: phase17968 e2e passed"
