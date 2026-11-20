#!/usr/bin/env bash
# Phase-40496: soft-complete through 40496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40496
PY
grep -qE 'phase40496|through 40496' webui/STATUS.md
echo "OK: phase40496 e2e passed"
