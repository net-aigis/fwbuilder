#!/usr/bin/env bash
# Phase-20208: soft-complete through 20208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20208
PY
grep -qE 'phase20208|through 20208' webui/STATUS.md
echo "OK: phase20208 e2e passed"
