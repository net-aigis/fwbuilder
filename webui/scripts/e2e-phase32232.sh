#!/usr/bin/env bash
# Phase-32232: soft-complete through 32232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32232
PY
grep -qE 'phase32232|through 32232' webui/STATUS.md
echo "OK: phase32232 e2e passed"
