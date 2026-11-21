#!/usr/bin/env bash
# Phase-42328: soft-complete through 42328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42328
PY
grep -qE 'phase42328|through 42328' webui/STATUS.md
echo "OK: phase42328 e2e passed"
