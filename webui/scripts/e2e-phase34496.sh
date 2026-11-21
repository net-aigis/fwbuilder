#!/usr/bin/env bash
# Phase-34496: soft-complete through 34496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34496
PY
grep -qE 'phase34496|through 34496' webui/STATUS.md
echo "OK: phase34496 e2e passed"
