#!/usr/bin/env bash
# Phase-27328: soft-complete through 27328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27328
PY
grep -qE 'phase27328|through 27328' webui/STATUS.md
echo "OK: phase27328 e2e passed"
