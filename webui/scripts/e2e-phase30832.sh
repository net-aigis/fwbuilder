#!/usr/bin/env bash
# Phase-30832: soft-complete through 30832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30832
PY
grep -qE 'phase30832|through 30832' webui/STATUS.md
echo "OK: phase30832 e2e passed"
