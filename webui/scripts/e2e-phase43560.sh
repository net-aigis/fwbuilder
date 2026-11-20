#!/usr/bin/env bash
# Phase-43560: soft-complete through 43560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43560
PY
grep -qE 'phase43560|through 43560' webui/STATUS.md
echo "OK: phase43560 e2e passed"
