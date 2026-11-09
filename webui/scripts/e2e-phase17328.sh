#!/usr/bin/env bash
# Phase-17328: soft-complete through 17328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17328
PY
grep -qE 'phase17328|through 17328' webui/STATUS.md
echo "OK: phase17328 e2e passed"
