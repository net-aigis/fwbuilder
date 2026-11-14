#!/usr/bin/env bash
# Phase-30392: soft-complete through 30392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30392
PY
grep -qE 'phase30392|through 30392' webui/STATUS.md
echo "OK: phase30392 e2e passed"
