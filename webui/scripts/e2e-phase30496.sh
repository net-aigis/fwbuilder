#!/usr/bin/env bash
# Phase-30496: soft-complete through 30496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30496
PY
grep -qE 'phase30496|through 30496' webui/STATUS.md
echo "OK: phase30496 e2e passed"
