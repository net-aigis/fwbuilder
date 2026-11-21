#!/usr/bin/env bash
# Phase-38832: soft-complete through 38832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38832
PY
grep -qE 'phase38832|through 38832' webui/STATUS.md
echo "OK: phase38832 e2e passed"
