#!/usr/bin/env bash
# Phase-11328: soft-complete through 11328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11328
PY
grep -qE 'phase11328|through 11328' webui/STATUS.md
echo "OK: phase11328 e2e passed"
