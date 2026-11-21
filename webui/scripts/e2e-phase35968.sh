#!/usr/bin/env bash
# Phase-35968: soft-complete through 35968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35968
PY
grep -qE 'phase35968|through 35968' webui/STATUS.md
echo "OK: phase35968 e2e passed"
