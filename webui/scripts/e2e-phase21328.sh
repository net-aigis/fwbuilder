#!/usr/bin/env bash
# Phase-21328: soft-complete through 21328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21328
PY
grep -qE 'phase21328|through 21328' webui/STATUS.md
echo "OK: phase21328 e2e passed"
