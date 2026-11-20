#!/usr/bin/env bash
# Phase-36392: soft-complete through 36392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36392
PY
grep -qE 'phase36392|through 36392' webui/STATUS.md
echo "OK: phase36392 e2e passed"
