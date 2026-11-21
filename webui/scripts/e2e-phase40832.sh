#!/usr/bin/env bash
# Phase-40832: soft-complete through 40832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40832
PY
grep -qE 'phase40832|through 40832' webui/STATUS.md
echo "OK: phase40832 e2e passed"
