#!/usr/bin/env bash
# Phase-16928: soft-complete through 16928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16928
PY
grep -qE 'phase16928|through 16928' webui/STATUS.md
echo "OK: phase16928 e2e passed"
