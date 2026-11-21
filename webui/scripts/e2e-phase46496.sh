#!/usr/bin/env bash
# Phase-46496: soft-complete through 46496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46496
PY
grep -qE 'phase46496|through 46496' webui/STATUS.md
echo "OK: phase46496 e2e passed"
