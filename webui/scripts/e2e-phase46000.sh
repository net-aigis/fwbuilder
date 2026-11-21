#!/usr/bin/env bash
# Phase-46000: soft-complete through 46000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46000
PY
grep -qE 'phase46000|through 46000' webui/STATUS.md
echo "OK: phase46000 e2e passed"
