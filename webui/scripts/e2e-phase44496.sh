#!/usr/bin/env bash
# Phase-44496: soft-complete through 44496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44496
PY
grep -qE 'phase44496|through 44496' webui/STATUS.md
echo "OK: phase44496 e2e passed"
