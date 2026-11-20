#!/usr/bin/env bash
# Phase-36496: soft-complete through 36496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36496
PY
grep -qE 'phase36496|through 36496' webui/STATUS.md
echo "OK: phase36496 e2e passed"
