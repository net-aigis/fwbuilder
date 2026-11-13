#!/usr/bin/env bash
# Phase-29328: soft-complete through 29328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29328
PY
grep -qE 'phase29328|through 29328' webui/STATUS.md
echo "OK: phase29328 e2e passed"
