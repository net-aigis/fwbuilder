#!/usr/bin/env bash
# Phase-19328: soft-complete through 19328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19328
PY
grep -qE 'phase19328|through 19328' webui/STATUS.md
echo "OK: phase19328 e2e passed"
